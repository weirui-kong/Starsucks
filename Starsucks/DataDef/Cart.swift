//
//  Cart.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

class Cart: ObservableObject{
    @Published var currentCart: [Product] = []
    
    var inclusivePrice: Int {
        return currentCart.reduce(0){$0+$1.price}
    }
    
    func clearCart(){
        self.currentCart = [Product]()
    }
    
    func addItem(_ item: Product){
        self.currentCart.append(item)
    }
    
    func addItemCopied(_ item: Product){
        self.currentCart.append(item.copied())
    }
    
    func productsOf(_ group: Product.ProductGroup) -> [Product]{
        return currentCart.filter({$0.group == group})
    }
    
    func countOf(_ group: Product.ProductGroup) -> Int{
        return currentCart.filter({$0.group == group}).count
    }
    
    func productsOf(_ title: String) -> [Product]{
        return currentCart.filter({$0.title == title})
    }
    
    func countOf(_ title: String) -> Int{
        return currentCart.filter({$0.title == title}).count
    }
    
    func removeIdentifiable(_ item: Product){
        currentCart.removeAll(where: {$0.id.uuidString == item.id.uuidString})
    }
    
}
