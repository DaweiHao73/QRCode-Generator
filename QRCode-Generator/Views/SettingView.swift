//
//  SettingView.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/11.
//

import SwiftUI
import MessageUI

enum Settings {
    static let darkMode       = "Dark Mode"
    static let appVersion     = "App Version"
    static let aboutUs        = "About Us"
    static let appIntro       = "App Introduction"
    static let shareAppByLink = "Share App URL"
    static let contactUs      = "Contact Us"
    static let privacyPolicy  = "Privacy Policy"
}

enum SettingContent {
    static let privacyPolicyUrl: String = "https://www.apple.com"
    static let appUrl: String           = "https://daweihao73.github.io/"
    static let developerMail: String    = "dwhao84@gmail.com"
}

struct SettingView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.openURL) private var openURL
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        NavigationStack {
            Form {
                darkModeSection
                
                informationSection
                    .tint(colorScheme == .dark ? .white : .black)
                supportSection
                    .tint(colorScheme == .dark ? .white : .black)
                privacyPolicySection
                    .tint(colorScheme == .dark ? .white : .black)
                appSettingSection
                    .tint(colorScheme == .dark ? .white : .black)
                copyrightView
            }
            .navigationTitle("Setting Page")
            .navigationBarTitleDisplayMode(.large)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }

    // MARK: - Dark Mode
    private var darkModeSection: some View {
        Section(Settings.darkMode) {
            Toggle(isOn: $isDarkMode) {
                Label {
                    Text("Dark Mode")
                        .foregroundStyle(Color.primary)
                } icon: {
                    Image(systemName: SFSymbol.sunMax)
                        .foregroundStyle(Color.yellow)
                }
            }
        }
    }

    // MARK: - Information
    struct SettingsRow<Destination: View>: View {
        let title: String
        let icon: String
        let iconColor: Color
        let destination: Destination

        init(title: String, icon: String, iconColor: Color, @ViewBuilder destination: () -> Destination) {
            self.title = title
            self.icon = icon
            self.iconColor = iconColor
            self.destination = destination()
        }

        var body: some View {
            NavigationLink(destination: destination) {
                Label {
                    Text(title)
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: icon)
                        .foregroundStyle(iconColor)
                }
            }
        }
    }

    private var informationSection: some View {
        Section("Information") {
            SettingsRow(title: "Version Info", icon: "info.circle", iconColor: .purple) {
                AppVersionView()
            }
            SettingsRow(title: "About Us", icon: "person.2.fill", iconColor: .pink) {
                AboutUsView()
            }
            SettingsRow(title: "App Intro", icon: SFSymbol.docRichtext, iconColor: .brown) {
                IntroView()
            }
            SettingsRow(title: "Share App", icon: SFSymbol.share, iconColor: .cyan) {
                ShareMyAppView()
            }
        }
    }


    // MARK: - Support (Email)
    private var supportSection: some View {
        Section("Support") {
            Button {
                EmailHelper.shared.sendEmail(
                    subject: "Requesting support",
                    body: """
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
                Label {
                    Text("Email to support")
                        .foregroundStyle(Color.primary)
                } icon: {
                    Image(systemName: SFSymbol.envelope)
                        .foregroundStyle(Color.yellow)
                }
            }
        }
    }

    // MARK: - Privacy Policy
    private var privacyPolicySection: some View {
        Section("Privacy Policy") {
            Button {
                if let url = URL(string: SettingContent.privacyPolicyUrl) {
                    openURL(url)
                }
            } label: {
                Label {
                    Text("Privacy Policy")
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: SFSymbol.handRaised)
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
    
    private var appSettingSection: some View {
        Section("App Setting") {
            Button {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Label {
                    Text("App Setting")
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: SFSymbol.setting)
                        .foregroundColor(Color.green)
                }
            }
        }
    }
    
    // MARK: - copyright View
    private var copyrightView: some View {
        Section {
            HStack {
                Text("Dawei2025 Right Reserved")
                    .font(.caption)
                    .foregroundStyle(.primary)
                    .fontWeight(.semibold)
                    .padding()
                
                Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "—")
                    .font(.caption2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .listRowBackground(Color.clear)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .previewDevice(.iPhone16Pro)
            .previewDisplayName(PreviewDevice.iPhone16Pro.rawValue)
        
        SettingView()
            .previewDevice(PreviewDevice.iPadPro11M4)
            .previewDisplayName(PreviewDevice.iPadPro11M4.rawValue)
    }
}
