//
//  ShareMyAppView.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/13.
//
import SwiftUI

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
