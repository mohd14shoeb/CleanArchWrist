//
//  EvenMoreSamplesView.swift
//  WatchSUI WatchKit Extension
//
//  Created by Laura on 27/1/21.
//  Copyright © 2021 ANKIT SHARMA. All rights reserved.
//

import SwiftUI

struct EvenMoreSamplesView: View {
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Image("Podcast")
                    .resizable()
                    .scaledToFit()
                Image("Rectangle")
                    .resizable()
                    .scaledToFit()
                Text("¡Hola!")
            }
            .cornerRadius(20)
            .frame(width: 90, height: 140, alignment: .center)
            .cornerRadius(20)
            HStack (spacing: 5) {
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "phone")
                    }
                })
                .buttonStyle(PlainButtonStyle())
                .padding()
                .background(Color.gray)
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "airplayaudio")
                    }
                })
                .buttonStyle(PlainButtonStyle())
                .padding()
                .background(Color.secondary)
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "applewatch")
                    }
                })
                .buttonStyle(PlainButtonStyle())
                .padding()
                .background(Color.secondary)
            }
            //.frame(width: .infinity, height: 40, alignment: .center)
            .cornerRadius(10)
        }
    }
}

struct EvenMoreSamplesView_Previews: PreviewProvider {
    static var previews: some View {
        EvenMoreSamplesView()
    }
}
