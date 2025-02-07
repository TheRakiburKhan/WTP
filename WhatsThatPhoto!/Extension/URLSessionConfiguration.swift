//
//  URLSessionConfiguration.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation

extension URLSessionConfiguration {
    class func beeda(accessToken: String, app: AppType) -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.allowsCellularAccess = true
        configuration.allowsConstrainedNetworkAccess = true
        configuration.allowsExpensiveNetworkAccess = true
        configuration.networkServiceType = .responsiveData
        configuration.waitsForConnectivity = true
        configuration.httpAdditionalHeaders = [
            "X-User-Agent": "iPhone",
            "x-app-name": "\(app.xAppName)",
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "\(accessToken)"
        ]
        
        return configuration
    }
}
