//
//  ContentView.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/11.
//

import SwiftUI
//import GoogleMobileAds

struct HomeScreenView: View {
    init() {
        // MARK: - Navigation Bar
        if #available(iOS 15.0, *) {
            let navAppearance = UINavigationBarAppearance()
            navAppearance.configureWithOpaqueBackground()
            
            navAppearance.backgroundColor = .systemBackground
            navAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
            navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
            navAppearance.shadowColor = .clear

            let navBar = UINavigationBar.appearance()
            navBar.standardAppearance   = navAppearance
            navBar.scrollEdgeAppearance = navAppearance
            navBar.compactAppearance    = navAppearance
            
        } else {
            
            let navBar = UINavigationBar.appearance()
            navBar.barTintColor = .black
            navBar.titleTextAttributes = [.foregroundColor: UIColor.label]
            navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
            navBar.shadowImage = UIImage()
            navBar.isTranslucent = false
        }
        UINavigationBar.appearance().tintColor = .systemBlue

        // MARK: - Tab Bar
        if #available(iOS 15.0, *) {
            let item = UITabBarItemAppearance()
            item.normal.iconColor = .gray
            item.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
            item.selected.iconColor = .systemBlue
            item.selected.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]

            let tabAppearance = UITabBarAppearance()
            tabAppearance.configureWithOpaqueBackground()
            tabAppearance.backgroundColor = .systemBackground
            tabAppearance.stackedLayoutAppearance = item
            tabAppearance.inlineLayoutAppearance = item
            tabAppearance.compactInlineLayoutAppearance = item

            let tabBar = UITabBar.appearance()
            tabBar.standardAppearance = tabAppearance
            tabBar.scrollEdgeAppearance = tabAppearance
        } else {
            let tabBar = UITabBar.appearance()
            tabBar.barTintColor = .systemBackground
            tabBar.tintColor = .systemBlue
            tabBar.unselectedItemTintColor = .gray
        }
    }

    var body: some View {
        TabView {
            QRCodeScreenView()
                .tabItem { Label("QRCode Generator", systemImage: SFSymbol.qrcode) }
            SettingView()
                .tabItem { Label("Setting", systemImage: SFSymbol.setting) }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
            HomeScreenView()
            .previewDevice(.iPhone16Pro)
            .previewDisplayName(PreviewDevice.iPhone16Pro.rawValue)

            HomeScreenView()
                .previewDevice(PreviewDevice.iPadPro11M4)
                .previewDisplayName(PreviewDevice.iPadPro11M4.rawValue)
    }
}
