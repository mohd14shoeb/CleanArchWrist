//
//  DetailView.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/27/20.
//

import SwiftUI
import ClockKit

struct DetailView: View {
    var item:MenuItem
    @Binding var selectedItem:Int!
    @Binding var selectedRow:Int!
    @State private var isRatingPresented = false
    @State private var isZooming = false
    
    func reloadTimeLine(){
        now = Date()
        let server = CLKComplicationServer.sharedInstance()
        if let active = server.activeComplications{
            for complication in active{
                server.reloadTimeline(for:complication)
            }
        }
    }
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text(item.name)
                        .fontWeight(.heavy)
                    Spacer()
                }
                Image("\(item.id)_100w")
                    .cornerRadius(10)
                    .onTapGesture{
                        self.isZooming.toggle()
                        WKInterfaceDevice.current().play(.click)
                    }
                    .sheet(isPresented: $isZooming, content:{
                        ZoomView(item:item)
                    })
                OrderButton(action:{
                    reloadTimeLine()
                    WKInterfaceDevice.current().play(.success)
                    self.selectedItem = self.item.id
                    self.selectedRow = nil //pop
                    
                })
                ScrollView{
                    Text(item.description)
                }
//                NavigationLink(destination:RatingsDetailView(item: item)){
//                    Text("Ratings")
//                }
                Button(action:{
                    self.isRatingPresented = true
                }){
                    Text("Ratings")
                }
                .sheet(isPresented:$isRatingPresented){
                    RatingsDetailView(item: item, isPresented: self.$isRatingPresented)
                }
            }.navigationBarTitle(item.name)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item:MenuModel.menu[2],selectedItem:.constant(2),selectedRow:.constant(2))
    }
}
