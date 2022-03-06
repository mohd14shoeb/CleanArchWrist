//
//  HomePresenter.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright Söderberg & Partners© 2021. All rights reserved.
//

import SwiftUI

class HomePresenter: BasePresenter {
    var wireframeInput: HomeWireframeInput?

    private let interactor: HomeInteractor

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }
}

extension HomePresenter: HomeViewOutput {}
