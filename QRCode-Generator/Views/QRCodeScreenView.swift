//
//  Generatorview.swift
//  QRCode-Generator
//
//  Created by Da Wei Hao on 2025/8/11.
//



import SwiftUI

extension QRCodeScreenView {
    
    var enterSection: some View {
        Section("Content") {
            enteredTextField
        }
    }
    
    // entered TextField
    var enteredTextField: some View {
        TextField("This is the text you want to change to QR code",
                  text: $text,
                  axis: .horizontal
        )
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .lineLimit(3...6)
    }
    
    // QR Code 設定區塊
    var settingsSection: some View {
        Section("Setting") {
            correctionLevelPicker
            scaleSliderSection
        }
    }
    
    // 誤差修正選擇器
    private var correctionLevelPicker: some View {
        Picker("Error correction", selection: $level) {
            ForEach(QRCodeGenerator.CorrectionLevel.allCases) { lv in
                Text(lv.label).tag(lv)
            }
        }
        .pickerStyle(.menu)
        .font(.title3) // 移到這裡讓整個 Picker 都套用
    }

    // 清晰度滑桿區塊
    private var scaleSliderSection: some View {
        VStack {
            HStack {
                Text("Clarity (magnification)")
                Spacer()
                Text("\(Int(scale))x").monospaced()
            }
            Slider(value: $scale, in: 4...20, step: 1)
        }
        .font(.title3)
    }
}

struct QRCodeScreenView: View {
    @State private var text: String = "https://google.com"
    @State private var level: QRCodeGenerator.CorrectionLevel = .m
    @State private var scale: Double = 10
    @State private var savedToast: Bool = false
    
    private let generator = QRCodeGenerator()
    
    var qrImage: UIImage? {
        generator.makeImage(from: text, correctionLevel: level, scale: CGFloat(scale))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                enterSection
                settingsSection
                
                Section("Preview") {
                    ZStack {
                        if let uiImage = qrImage {
                            // 讓圖在深/淺色都清楚
                            Image(uiImage: uiImage)
                                .interpolation(.none) // 保持銳利
                                .resizable()
                                .scaledToFit()
                                .padding(16)
                                .frame(maxWidth: .infinity, minHeight: 240)
                                .background(.background)
                                .contextMenu {
                                    Button {
                                        saveToPhotos(uiImage)
                                    } label: {
                                        Label("Saved to Photos", systemImage: SFSymbol.share)
                                    }
                                }
                        } else {
                            ContentUnavailableView(
                                "None Useful QR Code",
                                systemImage: SFSymbol.qrcode,
                                description: Text("Please enter correct message").font(.title3)
                            )
                            .frame(minHeight: 240)
                        }
                    }
                }
                
                if let uiImage = qrImage {
                    Section {
                        ShareLink(item: Image(uiImage: uiImage),
                                  preview: SharePreview("My QR Code",
                                  image: Image(uiImage: uiImage))) {
                            Label("Share QRCode Image", systemImage: SFSymbol.share)
                        }
                    }
                }
            }
            .navigationTitle("QRCode Generator")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toast("Saved in Photos", isPresented: $savedToast)
        }
    }
    
    // 簡單存圖（需要相簿權限）
    private func saveToPhotos(_ image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        savedToast = true
    }
}

// MARK: - 小小 Toast（純 SwiftUI）
private struct ToastModifier: ViewModifier {
    let message: String
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                Text(message)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(.thinMaterial, in: Capsule())
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .onAppear {
                        Task {
                            withAnimation { isPresented = false }
                        }
                    }
                    .padding(.top, 8)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .animation(.spring(duration: 0.35), value: isPresented)
    }
}

private extension View {
    func toast(_ message: String, isPresented: Binding<Bool>) -> some View {
        modifier(ToastModifier(message: message, isPresented: isPresented))
    }
}


// MARK: - 預覽
#Preview {
    QRCodeScreenView()
}

