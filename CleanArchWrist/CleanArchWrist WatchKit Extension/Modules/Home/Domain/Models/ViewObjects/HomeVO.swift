//
//  HomeVO.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

enum HomeState {
	case idle
}

extension HomeView {
	class ViewObject: ObservableObject {
		@Published var state: HomeState?

        init(
            state: HomeState? = nil
        ) {
			self.state = state
		}
	}
}
