//
//  NotificationView.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/27/20.
//

import SwiftUI

struct NotificationView: View {
    
    var bodyText:String = ""
    @State var id:Int = 0
    var body: some View {
        PizzaNotificationView(text:bodyText,id:$id)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
