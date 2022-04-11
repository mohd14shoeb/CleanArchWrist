//
//  HomeView.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import SwiftUI

struct HomeView: BaseView {
	var output: HomeViewOutput?
	@StateObject var viewObject: ViewObject

	var body: some View {
        switch viewObject.state {
        case .none, .main:
            HomeViewBody(model: viewObject.viewModel)
                .task {
                    output?.onRetrieve(viewObject)
                }
        }
	}
}

struct HomeViewBody: View {
    let model: HomeViewModel?

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                if let topics = model?.topics {
                    Text(topics.first ?? "")
                }
            }
        }
    }
}

#if DEBUG
struct HomeViewBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBody(model: HomeViewModel(topics: []))
    }
}
#endif
