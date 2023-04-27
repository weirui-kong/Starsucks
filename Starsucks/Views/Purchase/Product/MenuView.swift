//
//  MenuView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI
struct MenuView: View{
    @State var selectedGroup: Product.ProductGroup = .coffeeFusionIceCream
    @EnvironmentObject var cart: Cart
    
    var body: some View{
        ZStack{
            VStack{
                //head bar
                HStack{
                    Text("猩芭氪")
                        .frame(width: 100, alignment: .trailing)
                        .font(.title3)
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Starsucks")
                        .frame(width: 100, alignment: .leading)
                        .font(.title3)
                }.padding(5)
                //ad
                HStack{
                    Image("sale")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    Text(" 金星会员周二双倍积星🌟")
                        .font(.callout)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .scaledToFit()
                        .frame(width: 30)
                    
                }
                .padding(10)
                .foregroundColor(starsucksPremiumDarken)
                .background(Rectangle()
                    .frame(width: 10000, height: 50, alignment: .center).foregroundColor(starsucksPremium)
                )
                
                //Menu
                HStack{
                    //side selector cat
                    VStack{
                        //cafe´
                        VStack{
                            HStack{
                                Image(systemName: "location.circle")
                                    .foregroundColor(starsucksGreen)
                                Text("临潼奥莱")
                                    .foregroundColor(.gray)
                            }
                            HStack{
                                Text("选择门店")
                                Image(systemName: "chevron.right")
                            }
                        }.font(.caption)
                        .padding(10)
                        Spacer()
                        //group list
                        ScrollView(.vertical, showsIndicators: false){
                            ForEach(Product.ProductGroup.allCases, id: \.rawValue){ group in
                                Divider()
                                Button{
                                    withAnimation(){
                                        selectedGroup = group
                                    }
                                }label: {
                                    Text(group.rawValue)
                                        .font(.caption)
                                        .foregroundColor(starsucksGreen)
                                        .padding(10)
                                        .scaleEffect(1.1)
                                }
                                
                            }
                            Divider()
                            Spacer(minLength: 150)//to avoid overlapping cart view
                        }
                    }.frame(width: 100, alignment: .center)
                    Divider().padding(-8)
                    //items
                    ProductListView(selectedGroup: $selectedGroup)
                }
            }
            VStack{
                Spacer()
                CartOverviewView()
                    .frame(height: 120)
            }
        }
    }
}
