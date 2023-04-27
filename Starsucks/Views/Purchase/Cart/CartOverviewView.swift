//
//  CartOverviewView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

struct CartOverviewView: View{
    @State var showCartDetails = false
    @State var showCheckoutView = false
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var orderHistory: OrderHistoty
    var body: some View{
        ZStack{
            Capsule(style: .continuous)
                .shadow(color: .black, radius: 3, x: 0.0, y: 0.0)
                .padding()
                .foregroundColor(starsucksGreen)
            HStack{
                Button{
                    withAnimation(){
                        showCartDetails = true
                    }
                }label: {
                    Image(systemName: "cart.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .padding()
                }.sheet(isPresented: $showCartDetails, content: {
                    cartDetails
                })
                
                VStack(alignment: .leading){
                    Spacer()
                    Text("¥\(cart.inclusivePrice)")
                    Spacer()
                    Text("本单为非会员订单，无法累\n积星星及享受其他会员权益")
                        .font(.caption)
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
                
                Button{showCheckoutView = true}label: {
                    Text("确认订单")
                        .font(.title3)
                        .padding(5)
                }.buttonStyle(.borderedProminent)
                    .cornerRadius(20)
                    .padding()
                //.scaledToFill()
                    .fullScreenCover(isPresented: $showCheckoutView, content: {
                        CheckoutView(isTakingOrder: $showCheckoutView)
                            .environmentObject(cart)
                            .environmentObject(orderHistory)
                    })
            }.padding()
            
        }
    }
    var cartDetails: some View{
        NavigationView{
            VStack{
                if cart.currentCart.isEmpty{
                    VStack{
                        Spacer()
                        Text("购物车里是空的🕳️")
                            .font(.title2)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }else{
                    ScrollView{
                        ForEach(cart.currentCart){item in
                            ProductSmallCardView(previewType: .cartList, item: item)
                            //Divider()
                        }
                    }
                }
            }.navigationBarTitle("购物车", displayMode: .inline)
                .navigationBarItems(leading: Button{
                    self.showCartDetails = false
                }label: {
                    Image(systemName: "multiply.circle.fill")
                        .font(.title2)
                })
        }
    }
}
