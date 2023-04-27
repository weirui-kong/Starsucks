//
//  OrderView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI

struct OrderView: View{
    @EnvironmentObject var orderHistory: OrderHistoty
    var body: some View{
        ScrollView{
            ForEach($orderHistory.orders){item in
                OrderSmallCardView(order: item)
                    .padding()
            }
        }
    }
}
