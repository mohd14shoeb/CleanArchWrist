//
//  RatingsView.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/28/20.
//

import SwiftUI

struct RatingsView: View {
    @Binding var count:Int
    var maxStars:Int = 6
    var body: some View {
        HStack {
            ForEach(1...maxStars,id:\.self){ star in
                Image(systemName: star > self.count ? "star" : "star.fill")
                    .resizable().scaledToFit()
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(count:.constant(3))
    }
}
