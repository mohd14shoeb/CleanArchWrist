//
//  NetworkClientConstants.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import Foundation

enum NetworkClientConstants {
    enum Base {
        static let AppVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        static let AppBuild: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }

    enum Header {
        static let userAgent: String = {
            let appVersion = Base.AppVersion
            let build = Base.AppBuild
            return "CleanArchWrist/\(appVersion)\(build.isEmpty ? "" : ".")\(build)_iOS"
        }()
    }
}
