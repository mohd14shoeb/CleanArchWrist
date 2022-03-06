//
//  Repository+FundStore.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

// Repository for entities used in module FundStore

import Foundation
import RealmSwift

// MARK: - Local

extension Repository {
	/*func fetchFundDetails(fundId: Int) -> GetFundDetailsResult? {
		let results = databaseClient.realm?.objects(GetFundDetailsResult.self).filter("fund.fundId = %i", fundId)
		return results?.first?.freeze()
	}*/
}

// MARK: - Remote Web Service

extension Repository {
	/*func requestFundDetails(fundId: Int, callback: @escaping (Error?) -> Void) {
		FundsAPI.fundsGetFundDetails(
			getFundDetailsRequest: GetFundDetailsRequest(fundId: fundId)
		) { response, error in
			if let error = error {
				callback(error)
			} else {
				if let response = response {
					// Persist in database
					self.databaseClient.notificationToken = self.databaseClient.realm?.observe { _, _ in
						callback(nil)
					}
					self.persistInDataBase(
						modelType: GetFundDetailsResult.self,
						model: response,
						identifier: ["fund.fundId": NSNumber(value: fundId)],
						callback: callback
					)
					self.databaseClient.notificationToken?.invalidate()
				}
			}
		}
	}*/
}
