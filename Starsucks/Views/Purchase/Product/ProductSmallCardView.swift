//
//  ProductSmallCardView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

struct ProductSmallCardView: View{
    enum PreviewType{
        case productList
        case cartList
        case checkout
        case orderDetail
    }
    let previewType: PreviewType
    let item: Product
    @EnvironmentObject var cart: Cart
    init(previewType: PreviewType, item: Product) {
        self.previewType = previewType
        self.item = item
    }
    var body: some View{
        ZStack{
            HStack{
                Image(item.imgSrcLink)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 60, idealWidth: 90, maxWidth: 90, minHeight: 60, idealHeight: 90, maxHeight: 90, alignment: .center)
                    .cornerRadius(100, antialiased: true)
                    .padding(10)
                
                //tag and price
                VStack(alignment: .leading){
                    Spacer()
                    Text(item.title)
                    Spacer()
                    Text("¥\(item.price)")
                    Spacer()
                }
                Spacer()
                
            }
            //controller
            HStack{
                Spacer()
                VStack{
                    switch(previewType){
                    case .productList: productListViewAddMinusController
                    case .cartList: cartListRemoveController
                    case .checkout: checkoutController
                    case .orderDetail: orderDetailController
                    default: Text("Undefined")
                    }
                }.padding(20)
            }
        }
    }
    
    var productListViewAddMinusController: some View{
        VStack{
            Spacer()
            HStack{
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(starsucksGreen)
                    .font(.title2)
                    .onTapGesture {
                        withAnimation(){
//                            if let index = cart.currentCart.firstIndex(where: {$0.title == item.title}){
//                                cart.currentCart.remove(at: index)
//                            }
                            print("removal not defined yet")
                        }
                    }
                Text("\(cart.countOf(self.item.title))")
                    .frame(minWidth: 20)
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(starsucksGreen)
                    .font(.title2)
                    .onTapGesture {
                        //add `item` directly violates UUID()
                        withAnimation(){
                            cart.addItemCopied(item)
                        }
                    }
            }
        }
    }
    var cartListRemoveController: some View{
        Button{
            withAnimation(){
                cart.removeIdentifiable(self.item)
            }
        }label: {
            Text("不要了")
                .padding(5)
        }.buttonStyle(.borderedProminent)
            .cornerRadius(35)
            .padding()
            .scaledToFill()
    }
    var checkoutController: some View{
        Spacer()
    }
    var orderDetailController: some View{
        Text("共 1 件")
            .foregroundColor(.gray)
    }
}

