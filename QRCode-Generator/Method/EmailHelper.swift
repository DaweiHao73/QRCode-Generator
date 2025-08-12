//
//  EmailHelper.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/12.
//

import UIKit
import MessageUI

final class EmailHelper: NSObject, MFMailComposeViewControllerDelegate {
    static let shared = EmailHelper()
    private override init() {}

    func sendEmail(subject: String, body: String, to: String) {
        // 1) Apple Mail（內建 composer）
        if MFMailComposeViewController.canSendMail() {
            let vc = MFMailComposeViewController()
            vc.mailComposeDelegate = self
            vc.setSubject(subject)
            vc.setToRecipients([to])
            vc.setMessageBody(body, isHTML: false)
            topMostVC()?.present(vc, animated: true)
            return
        }

        // 2) 其他郵件 App（用 URL Scheme）
        let q = CharacterSet.urlQueryAllowed
        let s = subject.addingPercentEncoding(withAllowedCharacters: q) ?? ""
        let b = body.addingPercentEncoding(withAllowedCharacters: q) ?? ""

        let candidates: [String] = [
            "googlegmail://co?to=\(to)&subject=\(s)&body=\(b)",     // Gmail
            "ms-outlook://compose?to=\(to)&subject=\(s)&body=\(b)",  // Outlook
            "ymail://mail/compose?to=\(to)&subject=\(s)&body=\(b)",  // Yahoo
            "readdle-spark://compose?recipient=\(to)&subject=\(s)&body=\(b)", // Spark
            "airmail://compose?to=\(to)&subject=\(s)&plainBody=\(b)" // Airmail
        ]

        let app = UIApplication.shared
        for u in candidates.compactMap(URL.init(string:)) {
            if app.canOpenURL(u) {
                app.open(u)
                return
            }
        }

        // 3) mailto:（交給系統預設郵件 App 或瀏覽器）
        if let mailto = URL(string: "mailto:\(to)?subject=\(s)&body=\(b)") {
            app.open(mailto) { ok in
                if !ok { self.fallbackCopy(to: to, subject: subject, body: body) }
            }
            return
        }

        // 4) 最後手段：複製到剪貼簿並提示
        fallbackCopy(to: to, subject: subject, body: body)
    }

    private func fallbackCopy(to: String, subject: String, body: String) {
        UIPasteboard.general.string =
"""
To: \(to)
Subject: \(subject)

\(body)
"""
        let alert = UIAlertController(
            title: "找不到可用的郵件 App",
            message: "我已將信件內容複製到剪貼簿，你可貼到任何通訊工具傳送給我們。",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        topMostVC()?.present(alert, animated: true)
    }

    // 關閉內建 composer
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true)
    }

    // 取得最上層 VC
    private func topMostVC(_ base: UIViewController? = {
        let scene = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }.first
        let keyWindow = scene?.windows.first(where: { $0.isKeyWindow })
        return keyWindow?.rootViewController
    }()) -> UIViewController? {
        if let nav = base as? UINavigationController { return topMostVC(nav.visibleViewController) }
        if let tab = base as? UITabBarController { return topMostVC(tab.selectedViewController) }
        if let presented = base?.presentedViewController { return topMostVC(presented) }
        return base
    }
}
