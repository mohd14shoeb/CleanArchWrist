//
//  ContentView.swift
//  CookBook WatchKit Extension
//
//  Created by ladmin on 17.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack(spacing: 5) {
                Image("logo").resizable().frame(width: 48, height: 48, alignment: .center)
                Text("CookBook")
                    .font(.custom("SF Compact Display", size: 24))
                NavigationLink(
                    destination: ListSwiftUIView(),
                    label: {
                        Text("Nex")
                            .font(.custom("SF Compact Display", size: 17))
                            .foregroundColor(Color(red: 104/255, green: 53/255, blue: 41/255))
                            
                            
                    })
                    .frame(width: 184, height: 44, alignment: .center)
                    .background(Color(red: 255/255, green: 179/255, blue: 0/255))
                    .clipShape(RoundedRectangle(cornerRadius: 9))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
