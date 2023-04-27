//
//  ContentView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject var cart = Cart()
    @StateObject var orderHistoty = OrderHistoty()
    @State var showServerEndDebugSheet = false
    var body: some View {
        ZStack{
            //        NavigationView{
            //            VStack{
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(maxWidth: 200)
            //                    .padding()
            //                NavigationLink("Place Order", destination: MenuView())
            //                    .buttonStyle(.borderedProminent)
            //
            //            }
            //        }.navigationTitle("Starbucks")
            TabView{
                OrderView()
                    .environmentObject(orderHistoty)
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard")
                        Text("订单")
                    }
                MenuView()
                    .environmentObject(cart)
                    .environmentObject(orderHistoty)
                    .tabItem {
                        Image(systemName: "basket")
                        Text("选购")
                    }
                OrderView()
                    .environmentObject(orderHistoty)
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard")
                        Text("订单")
                    }
                AccountView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("账户")
                    }
                
            }
            
            //调试工具
            
            Button("服务端\n调试工具"){
                showServerEndDebugSheet = true
            }
            .actionSheet(isPresented: $showServerEndDebugSheet, content: {
                ActionSheet(title: Text("服务端调试工具"), buttons: [
                    //        case ordered = "已下单"
                    //case payed = "已付款"
                    //case inProgress = "制作中"
                    //case readyForPickup = "待取餐"
                    //case pickedUp = "已取餐"
                    //case orderCompleted = "订单完结"
                    //case afterSale = "售后中"
                    //case refunded = "已退款"
                    
                    .default(Text("已付款/接受付款")) {
                        do {
                        withAnimation(){
                            orderHistoty.orders[0].pay()
                        }
                    }
                    },
                    .default(Text("制作中/开始制作")) {
                        do {
                            withAnimation(){
                                orderHistoty.orders[0].inProgress()
                            }
                        }
                    },
                    .default(Text("待取餐/发送取餐码")) {
                        do {
                            withAnimation(){
                                orderHistoty.orders[0].readyForPickup(pickupCode: (100...200).shuffled().first!)
                            }
                        }
                    },
                    .default(Text("已取餐/完结订单")) {
                        do {
                            withAnimation(){
                                orderHistoty.orders[0].orderComplete()
                            }
                        }
                    },
                    
                    
                ])
            })
            
        }
        
    }
}




let starsucksGreen: Color = Color(uiColor: UIColor(red: 0, green: 122.0/255, blue: 74.0/255, alpha: 1))
let starsucksPremium: Color = Color(uiColor: UIColor(red: 210.0/255, green: 175.0/255, blue: 38.0/255, alpha: 0.2))
let starsucksPremiumDarken: Color = Color(uiColor: UIColor(red: 210.0/255, green: 175.0/255, blue: 38.0/255, alpha: 0.9))




//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
