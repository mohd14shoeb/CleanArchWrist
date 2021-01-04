//
//  ContentView.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/27/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Huli Pizza Company")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
            Divider()
            PizzaOrderView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
