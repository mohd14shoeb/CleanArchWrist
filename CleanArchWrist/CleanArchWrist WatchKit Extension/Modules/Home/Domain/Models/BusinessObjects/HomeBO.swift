//
//  HomeBO.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

extension HomeInteractor {
    struct BusinessObject {
		let viewState: HomeState?
        let isRequesting: Bool?

        init(
            viewState: HomeState? = nil,
            isRequesting: Bool? = nil
        ) {
            self.viewState = viewState
            self.isRequesting = isRequesting
        }
    }
}
