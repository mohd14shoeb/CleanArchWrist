//
//  NetworkClient.swift
//  Created by Laura on 1/3/21.
//

import Foundation
import Alamofire

struct NetworkClient {
    let session: Session

    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 20
        configuration.requestCachePolicy = .useProtocolCachePolicy
        session = Session(configuration: configuration)
    }

    enum Endpoint: String {
        case index = "https://raw.githubusercontent.com/laura-digio/CleanArch/master/API/REST/index.json"
    }

    func endpoint(
        method: HTTPMethod,
        endpoint: Endpoint,
        callback: @escaping (DataResponse<Index, AFError>) -> Void
    ) {
        let request = session.request(endpoint.rawValue, method: method)
        request.responseDecodable(of: Index.self, completionHandler: callback)
    }
}
