//
//  RowView.swift
//  TestWatchAppSwiftUI
//
//  Created by Steven Lipton on 4/9/20.
//  Copyright © 2020 Steven Lipton. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var menuItem:MenuItem
    @State private var pizzaZoom:Bool = false
    var body: some View {
        VStack {
            HStack {
                Image(String(format:"%i_100w",menuItem.id))
                .resizable()
                    .frame(width:pizzaZoom ? 60 : 30,height:pizzaZoom ? 60: 30)
                    .onTapGesture{
                        pizzaZoom.toggle()
                    }
                    .animation(.interpolatingSpring(stiffness: 12, damping: 3.0))
                .scaledToFit()
                    .clipShape(Circle())
                Text(menuItem.name)
                    .font(.caption).fontWeight(.bold)
                    .minimumScaleFactor(0.85)
                Spacer()
            }
            RatingsView(count: .constant(menuItem.rating))
                .frame(height:12).padding()
//            Text(menuItem.description)
//            Spacer()
        }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(menuItem: MenuModel.menu[1])
    }
}
