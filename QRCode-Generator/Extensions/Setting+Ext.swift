//
//  Setting+Ext.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/11.
//

import SwiftUI

// MARK: - AboutUsView
extension SettingView {
    struct AboutUsView: View {
        var body: some View {
            ScrollView { Text("About Us").padding() }
                .navigationTitle("About Us")
        }
    }
}


// MARK: - ContactUsView
extension SettingView {
    struct ContactUsView: View {
        var body: some View {
            Form {
                LabeledContent("Email", value: "dwhao84@gmail.com")
            }
            .navigationTitle("Contact Us")
        }
    }
}

// MARK: - IntroView
extension SettingView {
    struct IntroView: View {
        var body: some View {
            ScrollView { Text("App Feature and Function").padding() }
                .navigationTitle("Feature")
        }
    }
}


// MARK: - AppVersionView
extension SettingView {
    struct AppVersionView: View {
        var body: some View {
            List {
                LabeledContent("Version", value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "—")
                LabeledContent("Build", value: Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "—")
            }
            .navigationTitle("Version Info")
        }
    }
}
