//
//  OrderHistory.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

class OrderHistoty: ObservableObject{
    //@Published var orders: [Order] = [Order]()
    @Published var orders: [Order] = getTestOrderHistories()
    
    func placeOrder(cart: Cart, note: String) -> UUID{
        var newOrder = Order(products: cart.currentCart, note: note)
        newOrder.ordered()
        orders.insert(newOrder, at: 0)
        return newOrder.id
    }
}
