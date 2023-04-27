//
//  QRCodeView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let data: String
    
    var body: some View {
        Image(uiImage: generateQRCodeImage()) // 使用生成的二维码图片创建一个SwiftUI的Image视图
            .interpolation(.none) // 关闭插值以保持图像清晰
            .resizable()
            .scaledToFit()
    }
    
    func generateQRCodeImage() -> UIImage {
        let context = CIContext() // 创建一个CIContext对象
        let filter = CIFilter.qrCodeGenerator() // 创建一个二维码生成器的CIFilter对象
        
        let data = self.data.data(using: .utf8) // 将输入的数据转换为Data对象
        filter.setValue(data, forKey: "inputMessage") // 设置输入的数据
        filter.setValue("H", forKey: "inputCorrectionLevel") // 设置纠错级别（可选）
        
        let ciImage = filter.outputImage // 获取生成的CIImage对象
        let cgImage = context.createCGImage(ciImage!, from: ciImage!.extent) // 将CIImage对象转换为CGImage对象
        
        return UIImage(cgImage: cgImage!) // 将CGImage对象转换为UIImage对象并返回
    }
}
