//
//  OrderDetailView.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation
import SwiftUI
import MapKit
import CoreLocation

//struct MapView: View {
//    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 34.3668, longitude: 109.1881)
//
//    init(coordinate: CLLocationCoordinate2D) {
//        self.coordinate = coordinate
//    }
//
//    var body: some View {
//        Map(coordinateRegion: .constant(region), annotationItems: [MapAnnotation(coordinate: coordinate) {
//            Image("logo")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 40, height: 40)
//        }])
//    }
//
//    private var region: MKCoordinateRegion {
//        let metersPer500m: CLLocationDistance = 500
//        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: metersPer500m, longitudinalMeters: metersPer500m)
//        return coordinateRegion
//    }
//}

struct MapView: View{
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:  34.3668, longitude: 109.1881), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))

    var body: some View{
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            
        
    }
}
struct OrderDetailView: View{
    @Binding var order: Order
    var readyForPickup: Bool {
        return order.pickupCode != nil
    }
    var body: some View{
        ScrollView{
            MapView() // 传入 nil，显示用户当前位置
                .frame(height: 300)
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
                Spacer()
                Text("导航")
                    .foregroundColor(.gray)
                    .font(.callout)
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(.gray)
            }.padding()
            if readyForPickup{
                QRCodeView(data: "{\"code\":\(order.pickupCode!), \"id\": \"\(order.id)\"}")
                    .frame(minWidth: 100, idealWidth: 200, maxWidth: 500, minHeight: 100, idealHeight: 200, maxHeight: 500, alignment: .center)
                    .padding(20)
                Text("取餐码\(order.pickupCode!)")
                    .foregroundColor(.gray)
            }
            VStack(spacing: 10) {
                ForEach(order.products, id: \.id) { item in
                    ProductSmallCardView(previewType: .orderDetail, item: item)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("订单状态")
                            .foregroundColor(.gray)
                //order history
                ForEach(order.statusHistory, id:\.1){ status in
                    HStack(){
                        Text(status.0.rawValue)
                        Spacer()
                        Text(status.1.toLocalTime())
                        
                    }
                    .font(.callout)
                    .foregroundColor(.gray.opacity(0.8))
                    
                }
            }

            .padding()
        }.ignoresSafeArea(.all)
            
    }
}




extension Date {
    func toLocalTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd-HH:mm:ss"
        let formattedString = dateFormatter.string(from: self)
        return formattedString
    }
}
