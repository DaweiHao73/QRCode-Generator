//
//  ShareMyAppView.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/13.
//

import SwiftUI

struct ShareMyAppView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            titleText
            subtitleText
            qrcodeImage
            openAppStoreButton
            copyAppLinkButton
            Spacer()
        }
        .padding(.horizontal, 50)
    }
    
    // MARK: - title text
    var titleText: some View {
        Text("Share QRCode Generator")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 30)
    }
    
    // MARK: - subtitle text
    var subtitleText: some View {
        Text("Share this useful app with your friends!")
            .font(.title3)
            .fontWeight(.regular)
            .foregroundStyle(.gray)
    }
    
    // MARK: - qrcode Image
    var qrcodeImage: some View {
        Image("QRCodeImage") // 請換成你的 QRCode 圖片名稱
            .resizable()
            .scaledToFit()
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    // MARK: - open App Store Button
    var openAppStoreButton: some View {
        Button {
            print("Share my app button tapped")
            
        } label: {
            Label {
                Text("Open in App Store")
                    .fontWeight(.semibold)
                    .font(.title3)
            } icon: {
                Image(systemName: SFSymbol.globe)
                    .font(.title3)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(25)
        }
    }
    
    // MARK: - copyAppLinkButton
    var copyAppLinkButton: some View {
        Button {
            print("Copy app's link button tapped")
            
        } label: {
            Label {
                Text("Copy App's Link")
                    .fontWeight(.semibold)
                    .font(.title3)
            } icon: {
                Image(systemName: SFSymbol.globe)
                    .font(.title3)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(30)
        }
    }
}

// MARK: - Preview
struct ShareMyAppView_Previews: PreviewProvider {
    static var previews: some View {
        ShareMyAppView()
            .previewDevice(.iPhone16Pro)
            .previewDisplayName(PreviewDevice.iPhone16Pro.rawValue)
        
        ShareMyAppView()
            .previewDevice(PreviewDevice.iPadPro11M4)
            .previewDisplayName(PreviewDevice.iPadPro11M4.rawValue)
    }
}
