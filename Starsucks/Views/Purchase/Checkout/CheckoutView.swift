//
//  CheckoutView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI
import LocalAuthentication
import PassKit

struct CheckoutView: View {
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var orderHistory: OrderHistoty
    @Binding var isTakingOrder: Bool
    @State private var isAuthenticationShowing = false
    @State private var authenticationResult = false
    var body: some View {
        NavigationView{
            VStack {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(cart.currentCart, id: \.id) { item in
                            ProductSmallCardView(previewType: .checkout, item: item)
                        }
                    }
                    .padding()
                }
                Button(action: {
                    // to place order here
                    let id: UUID = orderHistory.placeOrder(cart: cart, note: "用户需要餐巾纸")
                    self.authenticate()
                }, label: {
                    Text("提交订单")
                        .font(.title2)
                        .padding(5)
                        .cornerRadius(10)
                }).buttonStyle(.borderedProminent)
                    .padding()
            }.navigationBarTitle("确认订单", displayMode: .inline)
                .navigationBarItems(leading: Button{
                    self.isTakingOrder = false
                }label: {
                    Image(systemName: "multiply.circle.fill")
                        .font(.title2)
                })
            
        }
        .alert(isPresented: $isAuthenticationShowing) {
            //place order
            
            if authenticationResult {
                
                return Alert(title: Text("付款成功"),
                             message: Text("你的订单已经成功提交并付款¥\(cart.inclusivePrice)"),
                             dismissButton: .destructive(Text("好"), action: {
                    
                    self.isTakingOrder = false
                    cart.clearCart()
                })
                )
            }else {
                return Alert(title: Text("认证失败"),
                             message: Text("生物信息不匹配"),
                             dismissButton: .default(Text("好"))
                )
            }
        }
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Authenticate to access the app") { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.authenticationResult = true
                    } else {
                        self.authenticationResult = false
                    }
                    self.isAuthenticationShowing = true
                }
            }
        } else {
            // 检查设备是否支持 Face ID 或 Touch ID，如果不支持，可以进行相应的处理
            print("Error: \(error?.localizedDescription ?? "")")
        }
    }
}

