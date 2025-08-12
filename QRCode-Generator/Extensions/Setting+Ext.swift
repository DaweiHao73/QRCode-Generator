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

// MARK: - Share my app
extension SettingView {
    struct ShareMyAppView: View {
        var body: some View {
            Text("Share my app")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            VStack(spacing: 20) {
                Image("")
                    .resizable()
                    .background().colorScheme(.dark)
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(.buttonBorder)
                
                Text("Share QR code")
                    .font(.title2)
                    .fontWeight(.regular)
                
                Button {
                    print("Share my app button tapped")
                } label: {
                    Label(
                        title: {
                            Text("Share my app")
                                .fontWeight(.regular)
                                .font(.title3)
                        },
                        icon: {
                            Image(systemName: SFSymbol.share)
                                .font(.title3)
                        }
                    )
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(25)
                }
                
                Spacer()
            }
        }
    }
}

// MARK: - AppVersionView
extension SettingView {
    struct AppVersionView: View {
        var body: some View {
            List {
                LabeledContent("版本", value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "—")
                LabeledContent("Build", value: Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "—")
            }
            .navigationTitle("版本資訊")
        }
    }
}
