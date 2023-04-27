//
//  Product.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

struct Product: Identifiable{
    enum ProductGroup: String, CaseIterable{
        case coffeeFusionIceCream = "咖啡融合冰淇淋"
        case coldBrewCoffeeSeries = "星巴克冷萃咖啡系列"
        case handcraftedEspresso = "手工调制浓缩咖啡"
        case frappuccino = "星冰乐®"
        case nitroColdBrewCoffee = "气致™冷萃咖啡"
        case classicChocolateBeverage = "经典巧克力饮品"
        case teavana = "茶瓦纳™"
        case darkRoast = "深度烘焙"
        case mediumRoast = "中度烘焙"
        case starbucksVIA_BLACK = "星巴克VIA® BLACK"
        case starbucksVIA_DAIRY = "星巴克VIA® DAIRY"
        case bakedGoodsAndDesserts = "蛋糕&甜品"
        case otherFood = "其他美食"
        case sandwichesPaninis = "三明治、帕尼尼、卷"
        case yogurt = "酸奶"
        case regularProducts = "常规产品"
        case premiumProducts = "臻选产品"
        case other = "其他"
    }
    let id: UUID
    let group: ProductGroup
    let title: String
    let price: Int
    let imgSrcLink: String
    static let productList: [Product] = getTestProducts()
    
    init(group: ProductGroup, title: String, price: Int, imgSrcLink: String){
        self.id = UUID()
        self.group = group
        self.title = title
        self.price = price
        self.imgSrcLink = imgSrcLink
    }
    //not chaging the original data but giving a new preview type
    init(product: Product){
        self.id = UUID()
        self.group = product.group
        self.title = product.title
        self.price = product.price
        self.imgSrcLink = product.imgSrcLink
        print("copied with new UUID")
    }
    
    func copied() -> Product{
        return Product(product: self)
    }
    
    static func productsOf(_ group: Product.ProductGroup) -> [Product]{
        return Product.productList.filter({$0.group == group})
    }
    
    static func countOf(_ group: Product.ProductGroup) -> Int{
        return Product.productList.filter({$0.group == group}).count
    }
    
    static func productsOf(_ title: String) -> [Product]{
        return Product.productList.filter({$0.title == title})
    }
    
    static func countOf(_ title: String) -> Int{
        return Product.productList.filter({$0.title == title}).count
    }
}
