//
//  RatingsDetailView.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/28/20.
//

import SwiftUI

struct RatingsDetailView: View {
    var item:MenuItem
    @Binding var isPresented:Bool
    @State var myRating:Float = 0
    var body: some View {
        VStack {
            Text("\(myRating)")
            RatingsView(count: .constant(Int(myRating)))
            Image("\(item.id)_100w")
            Button(action:{self.isPresented = false}){
                Text("Okay")
            }
        }
        .navigationBarTitle(item.name)
        .focusable(true)
        .digitalCrownRotation($myRating,
              from: 0, through: 6, by: 1,
              sensitivity: .low,
              isContinuous: false,
              isHapticFeedbackEnabled: true)
    }
}

struct RatingsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsDetailView(item:MenuModel.menu[6],isPresented: .constant(true))
    }
}
