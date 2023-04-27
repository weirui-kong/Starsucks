//
//  ProductListView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

struct ProductListView: View{
    @Binding var selectedGroup: Product.ProductGroup
    @EnvironmentObject var cart: Cart
    var body: some View{
        ScrollView{
            //current group
            HStack{
                Image("sale")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("\(selectedGroup.rawValue)(\(Product.countOf(selectedGroup)))")
                Spacer()
            }.padding(5)
            ForEach(Product.productsOf(selectedGroup)){item in
                ProductSmallCardView(previewType: .productList, item: item)
                //Divider()
            }
            Spacer(minLength: 150)//to avoid overlapping cart view
        }
    }
}
