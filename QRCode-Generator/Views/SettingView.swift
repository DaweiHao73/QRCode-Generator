//
//  SettingView.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/11.
//

import SwiftUI
import MessageUI

enum Settings {
    static let darkMode       = "深色模式"
    static let appVersion     = "應用程式版本"
    static let aboutUs        = "關於我們"
    static let appIntro       = "App 介紹"
    static let shareAppByLink = "分享App連結"
    static let contactUs      = "聯絡我們"
    static let privacyPolicy  = "隱私政策"
}

enum SettingContent {
    static let privacyPolicyUrl: String = ""
    static let appUrl: String           = "https://daweihao73.github.io/"
    static let developerMail: String    = "dwhao84@gmail.com"
}

struct SettingView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        NavigationStack {
            Form {
                Section("設定") {
                    Toggle(Settings.darkMode, isOn: $isDarkMode)
                }
                
                Section("資訊") {
                    NavigationLink("版本資訊") { AppVersionView() }
                    NavigationLink(Settings.aboutUs) { AboutUsView() }
                    NavigationLink(Settings.appIntro) { IntroView() }
                    NavigationLink(Settings.shareAppByLink) { ShareMyAppView() }
                    
                    Button {
                        EmailHelper.shared.sendEmail(
                            subject: "Requesting support",
                            body:
"""
App: QRCode-Generator
Issue:
(請描述你的問題)

Device Info:
- iOS: \(UIDevice.current.systemVersion)
- Model: \(UIDevice.current.model)
""",
                            to: SettingContent.developerMail
                        )
                    } label: {
                        Text("Email to support")
                    }
                }
                
                Section("資訊") {
                    HStack {
                        Text("隱私權政策")
                        Spacer()
                        Button("開啟") {
                            if let url = URL(string: "https://www.apple.com") {
                                openURL(url)
                            }
                        }
                    }
                }
            }
            .navigationTitle("設定頁面")
            .navigationBarTitleDisplayMode(.large)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    SettingView()
}
