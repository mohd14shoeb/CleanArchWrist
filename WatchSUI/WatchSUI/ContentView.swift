//
//  ContentView.swift
//  WatchSUI
//
//  Created by ANKIT SHARMA on 04/01/20.
//  Copyright © 2020 ANKIT SHARMA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var userName:String
    @State var password:String
    var body: some View {
        
        VStack {
            TextField("User Name", text: $userName)
                .textContentType(.username)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            SecureField("Password", text: $password)
                .textContentType(.password)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            Button(action: {print("Authenticated")})
            {
                Text("Done")
                    .font(.largeTitle)
            }
            //Button("Done"){
            //}.disabled(userName.isEmpty || password.isEmpty)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userName: "", password: "")
    }
}
