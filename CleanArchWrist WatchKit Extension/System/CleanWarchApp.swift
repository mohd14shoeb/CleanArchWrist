//
//  CleanArchWristApp.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import SwiftUI

@main
struct CleanArchWristApp: App {
    let appEnvironment = AppEnvironment()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeWireframe(params: HomeParams(initialState: .main)).view
            }
            .environmentObject(appEnvironment)
        }
    }
}
