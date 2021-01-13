//
//  ContentView.swift
//  WatchSUI WatchKit Extension
//
//  Created by ANKIT SHARMA on 04/01/20.
//  Copyright © 2020 ANKIT SHARMA. All rights reserved.
//

import SwiftUI
import WatchKit

struct ContentView: View {

    @State var userName: String
    @State var password: String

    @State private var vibrateOnRing = true
    @State private var vibrateOnSilent = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("User Name", text: $userName)
                    .textContentType(.username)
                    .multilineTextAlignment(.center)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .multilineTextAlignment(.center)
                Button("Done") {
                }.disabled(userName.isEmpty || password.isEmpty)
            }

            Text("Hamlet")
                .font(.title)
            Text("by William Shakespeare")
                .font(.system(size: 12, weight: .light, design: .serif))
                .italic()

            HStack {
                Button("Sign In", action: {})
                Button("Register", action: {})
            }
            .buttonStyle(BorderedButtonStyle())

            Link("View Our Terms of Service", destination: URL(string: "https://github.com/laura-digio/CleanArch/blob/master/doc/three-tier.md")!)

            VStack {
                Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
                Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
            }

            NavigationLink("SamplesView", destination: SamplesView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userName: "", password: "")
    }
}
