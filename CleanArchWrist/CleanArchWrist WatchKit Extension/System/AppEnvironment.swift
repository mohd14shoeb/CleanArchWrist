//
//  AppEnvironment.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 5/3/22.
//

import SwiftUI

final class AppEnvironment: ObservableObject {
    @Published var bottomMenuSelection: AppConstants.BottomBar = .home
}
