//
//  Order.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

struct Order: Identifiable{
    enum OrderStatus: String, CaseIterable{
        case ordered = "已下单"
        case payed = "已付款"
        case inProgress = "制作中"
        case readyForPickup = "待取餐"
        case pickedUp = "已取餐"
        case orderCompleted = "订单完结"
        
        case afterSale = "售后中"
        case refunded = "已退款"
        
        case undefined
    }
    enum SettlementType: CaseIterable{
        case charge
        case refund
        
        case undefined
    }
    //general
    let products: [Product]
    let note: String?
    let store: String
    var id: UUID
    var pickupCode: Int?
    var grossPrice: Int{
        return self.products.reduce(0, {$0 + $1.price})
    }
    //order status
    var statusHistory: [(OrderStatus, Date)]
    
    var currentStatus: (OrderStatus, Date) {
        return self.statusHistory.last!
    }
    
    //payment
    var settlementHistory: [(SettlementType, Date, Int)]
    var netSettlement: Int {
        return settlementHistory.reduce(0) { (result, settlement) in
            let settlementType = settlement.0
            let amount = settlement.2
            
            switch settlementType {
            case .charge:
                return result + amount
            case .refund:
                return result - amount
            default:
                return result
            }
        }
    }
    
    init(products: [Product], note: String?) {
        self.products = products
        self.note = note
        self.statusHistory = [(OrderStatus, Date)]()
        //self.statusHistory.append((OrderStatus.ordered, Date()))
        self.settlementHistory = [(SettlementType, Date, Int)]()
        self.store = "西安西恩奥特莱斯店"
        self.id = UUID()
    }
    
    init(products: [Product], note: String?, statusHistory: [(OrderStatus, Date)], settlementHistory: [(SettlementType, Date, Int)], id: UUID) {
        self.products = products
        self.note = note
        self.statusHistory = statusHistory
        self.settlementHistory = settlementHistory
        self.store = "西安西恩奥特莱斯店"
        self.id = id
    }
    
    mutating func ordered(){
        self.statusHistory.append((OrderStatus.ordered, Date()))
    }
    mutating func pay(pay paidAmount: Int) -> Bool{
        self.statusHistory.append((OrderStatus.payed, Date()))
        self.settlementHistory.append((SettlementType.charge, Date(), paidAmount))
        return true
    }
    mutating func pay() -> Bool{
        self.statusHistory.append((OrderStatus.payed, Date()))
        self.settlementHistory.append((SettlementType.charge, Date(), grossPrice))
        return true
    }
    mutating func inProgress(){
        self.statusHistory.append((OrderStatus.inProgress, Date()))
    }
    mutating func readyForPickup(pickupCode code: Int){
        self.pickupCode = code
        self.statusHistory.append((OrderStatus.readyForPickup, Date()))
        //return
    }
    mutating func pickUp(){
        self.statusHistory.append((OrderStatus.pickedUp, Date()))
    }
    mutating func orderComplete(){
        self.statusHistory.append((OrderStatus.orderCompleted, Date()))
    }
    
    mutating func afterSale(){
        self.statusHistory.append((OrderStatus.afterSale, Date()))
    }
    mutating func refund(refund refundAmount: Int, plea pleaText: String) -> Bool{
        if netSettlement - refundAmount >= 0{
            self.settlementHistory.append((SettlementType.refund, Date(), refundAmount))
            self.statusHistory.append((OrderStatus.refunded, Date()))
            return true
        }else{
            return false
        }
    }
}
