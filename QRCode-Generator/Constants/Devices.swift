//
//  Devices.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/12.
//

import Foundation
import SwiftUI

extension PreviewDevice {
    // MARK: - iPhone
    static let iPhone16 = PreviewDevice(rawValue: "iPhone 16")
    static let iPhone16Pro = PreviewDevice(rawValue: "iPhone 16 Pro")
    static let iPhone15ProMax = PreviewDevice(rawValue: "iPhone 15 Pro Max")
    static let iPhoneSE3 = PreviewDevice(rawValue: "iPhone SE (3rd generation)")
    
    // MARK: - iPad
    static let iPadPro129Gen5 = PreviewDevice(rawValue: "iPad Pro 12.9-inch (5th generation)")
    static let iPadPro11M4 = PreviewDevice(rawValue: "iPad Pro 11-inch (M4)")
    static let iPadMini6 = PreviewDevice(rawValue: "iPad mini (6th generation)")
}

