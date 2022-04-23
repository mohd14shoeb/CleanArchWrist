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
            HomeViewBody(model: viewObject.viewModel) { link in
                output?.onTapCell(link)
            }
            .task {
                output?.onRetrieve(viewObject)
            }
        }
	}
}

struct HomeViewBody: View {
    let model: HomeViewModel?
    let action: ((String) -> Void)?

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                if let topics = model?.topics {
                    ForEach(topics, id: \.self) { topic in
                        MainCellView(label: topic.title) {
                            if let link = topic.link {
                                action?(link)
                            }
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct HomeViewBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBody(model: HomeViewModel(topics: []), action: nil)
    }
}
#endif
