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
@State var userName:String
@State var password:String
    var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userName: "", password: "")
    }
}
