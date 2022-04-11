//
//  CleanArchWristApp.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import SwiftUI

@main
struct CleanArchWristApp: App {
    var body: some Scene {
        WindowGroup {
            HomeWireframe(params: HomeParams(initialState: .main)).view
        }
    }
}
