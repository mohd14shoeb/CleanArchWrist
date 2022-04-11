//
//  HomeViewModel.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 13/1/22.
//  Copyright © 2022 Söderberg & Partners. All rights reserved.
//

import Foundation

struct HomeViewModel {
    let topics: [String]?

    static func mapFromAPI(_ APIModel: Index?) -> HomeViewModel? {
        guard let APIModel = APIModel else {
            return nil
        }

        return HomeViewModel(
            topics: APIModel.topics.compactMap { $0.title }
        )
    }
}
