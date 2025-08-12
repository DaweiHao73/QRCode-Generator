//
//  QRCodeGenerator.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/11.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI

struct QRCodeGenerator {
    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()
    
    /// 產生放大後的 QR Code 圖片
    func makeImage(from text: String, correctionLevel: CorrectionLevel = .m, scale: CGFloat = 10) -> UIImage? {
        guard !text.isEmpty else { return nil }
        let data = Data(text.utf8)
        filter.message = data
        filter.correctionLevel = correctionLevel.rawValue  // L/M/Q/H
        
        guard let outputImage = filter.outputImage else { return nil }
    
        let transformed = outputImage.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
        
        guard let cgImage = context.createCGImage(transformed, from: transformed.extent) else { return nil }
        return UIImage(cgImage: cgImage)
    }
    
    enum CorrectionLevel: String, CaseIterable, Identifiable {
            case l = "L", m = "M", q = "Q", h = "H"
            var id: String { rawValue }
            var label: String {
                switch self {
                case .l: return "L（低）"
                case .m: return "M（中）"
                case .q: return "Q（較高）"
                case .h: return "H（最高）"
                }
            }
        }
}

