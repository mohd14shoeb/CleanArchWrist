//
//  HomeOnRetrieveUseCase.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Agustin Ovari on 18/1/22.
//  Copyright © 2022 Söderberg & Partners. All rights reserved.
//

import Foundation

struct HomeOnRetrieveUseCase: BaseUseCase {
	internal let repository: Repository

	typealias Params = Void
	typealias Response = HomeInteractor.BusinessObject

	init(repository: Repository) {
		self.repository = repository
	}

	func execute(completion: @escaping Handler<Response>) {}
}
