//
//  CleanArchWristApp.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import SwiftUI

@main
struct CleanArchWristApp: App {
    @WKExtensionDelegateAdaptor var extensionDelegate: ExtensionDelegate
    @StateObject var appEnvironment = AppEnvironment()

    var body: some Scene {
        WindowGroup {
            TabView(selection: $appEnvironment.bottomMenuSelection) {
                // Tab 1
                HomeWireframe(params: HomeParams(initialState: .default)).view
                    .modifier(BottomMenuModifier(
                        title: "moduleHomeTitle".localized(),
                        image: Assets.Images.iconApple,
                        tag: .home
                    ))
            }
            .environmentObject(appEnvironment)
        }
    }
}

class ExtensionDelegate: NSObject, WKExtensionDelegate {
    var rootInterfaceController: WKInterfaceController?

    func applicationDidFinishLaunching() {}
}
