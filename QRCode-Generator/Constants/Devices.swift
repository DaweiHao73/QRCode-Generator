//
//  Devices.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/12.
//

import Foundation

enum Devices: String, CaseIterable {
    // MARK: - iPhone
    case iPhoneXR = "iPhone XR"
    case iPhoneXS = "iPhone Xs"
    case iPhoneXSMax = "iPhone Xs Max"
    case iPhone11 = "iPhone 11"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    case iPhone12Mini = "iPhone 12 mini"
    case iPhone12 = "iPhone 12"
    case iPhone12Pro = "iPhone 12 Pro"
    case iPhone12ProMax = "iPhone 12 Pro Max"
    case iPhone13Mini = "iPhone 13 mini"
    case iPhone13 = "iPhone 13"
    case iPhone13Pro = "iPhone 13 Pro"
    case iPhone13ProMax = "iPhone 13 Pro Max"
    case iPhone14 = "iPhone 14"
    case iPhone14Plus = "iPhone 14 Plus"
    case iPhone14Pro = "iPhone 14 Pro"
    case iPhone14ProMax = "iPhone 14 Pro Max"
    case iPhone15 = "iPhone 15"
    case iPhone15Plus = "iPhone 15 Plus"
    case iPhone15Pro = "iPhone 15 Pro"
    case iPhone15ProMax = "iPhone 15 Pro Max"
    case iPhone16 = "iPhone 16"
    case iPhone16Plus = "iPhone 16 Plus"
    case iPhone16Pro = "iPhone 16 Pro"
    case iPhone16ProMax = "iPhone 16 Pro Max"
    case iPhone16e = "iPhone 16e"
    case iPhoneSE2 = "iPhone SE (第二代)"
    case iPhoneSE3 = "iPhone SE (第三代)"
    
    // MARK: - iPad
    case iPadMini6 = "iPad mini (6th generation)"
    case iPad10 = "iPad (10th generation)"
    case iPadAir4 = "iPad Air (4th generation)"
    case iPadAir5 = "iPad Air (5th generation)"
    case iPadAir11M2 = "iPad Air 11-inch (M2)"
    case iPadAir13M2 = "iPad Air 13-inch (M2)"
    case iPadPro11Gen1 = "iPad Pro 11-inch (1st generation)"
    case iPadPro11Gen2 = "iPad Pro 11-inch (2nd generation)"
    case iPadPro11Gen3 = "iPad Pro 11-inch (3rd generation)"
    case iPadPro11Gen4 = "iPad Pro 11-inch (4th generation)"
    case iPadPro11M4 = "iPad Pro 11-inch (M4)"
    case iPadPro129Gen3 = "iPad Pro 12.9-inch (3rd generation)"
    case iPadPro129Gen4 = "iPad Pro 12.9-inch (4th generation)"
    case iPadPro129Gen5 = "iPad Pro 12.9-inch (5th generation)"
    case iPadPro129Gen6 = "iPad Pro 12.9-inch (6th generation)"
    case iPadMini5 = "iPad mini (5th generation)"
    case iPad6 = "iPad (6th generation)"
    case iPad7 = "iPad (7th generation)"
    case iPad8 = "iPad (8th generation)"
    case iPad9 = "iPad (9th generation)"
    case iPadAir3 = "iPad Air (3rd generation)"
    case iPadPro105 = "iPad Pro 10.5-inch"
    case iPadPro129Gen2 = "iPad Pro 12.9-inch (2nd generation)"
    
    static let all: [Devices] = Array(Self.allCases)
}
