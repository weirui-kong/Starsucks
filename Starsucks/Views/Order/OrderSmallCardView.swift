//
//  OrderSmallCardView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

struct OrderSmallCardView: View{
    @Binding var order: Order
    @State var showOrderDetails = false
    var body: some View{
        VStack{
            //store and status
            HStack{
                //store info
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, alignment: .center)
                VStack(alignment: .leading){
                    Text(order.store)
                    Text("甄选·星小铺")
                        .foregroundColor(starsucksPremiumDarken)
                }.font(.callout)
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(.gray)
                Spacer()
                //status
                Text(order.currentStatus.0.rawValue)
                    .foregroundColor(.gray)
            }
            
            //products
            HStack{
                ForEach(order.products.prefix(3)){item in
                    Image(item.imgSrcLink)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(60, antialiased: true)
                        .frame(width: 60)
                        .overlay(
                            Circle()
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                }
                
                Spacer()
                VStack{
                    Text("¥\(self.order.grossPrice)")
                    Text("共 \(self.order.products.count) 件")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            //actions
            HStack{
                Spacer()
                Button{ return }label: {
                    Text("申请售后")
                        .font(.callout)
                    
                }.buttonStyle(.bordered)
                    .cornerRadius(5)
                
                Button{ showOrderDetails = true }label: {
                    Text("查看订单")
                        .font(.callout)
                }.buttonStyle(.borderedProminent)
                    .cornerRadius(5)
                    .fullScreenCover(isPresented: $showOrderDetails, content: {
                        NavigationView{
                            OrderDetailView(order: $order)
                                .navigationTitle(order.currentStatus.0.rawValue)
                                .navigationBarItems(
                                    leading: Button{
                                        showOrderDetails = false
                                    } label: {
                                        Image(systemName: "multiply.circle.fill")
                                            .font(.title2)
                                    },
                                    trailing: Button{
                                        guard let url = URL(string: "tel:+8610086") else {
                                            return
                                        }
                                        if UIApplication.shared.canOpenURL(url) {
                                            UIApplication.shared.open(url)
                                        }
                                    } label: {
                                        Image(systemName: "person.2.wave.2.fill")
                                            .font(.title3)
                                    }.buttonStyle(.bordered)
                                )
                        }
                    })
            }
            
        }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}
