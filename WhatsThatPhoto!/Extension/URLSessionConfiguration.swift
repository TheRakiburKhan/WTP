//
//  URLSessionConfiguration.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation

extension URLSessionConfiguration {
    class func wtp(accessToken: String) -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.allowsCellularAccess = true
        configuration.allowsConstrainedNetworkAccess = true
        configuration.allowsExpensiveNetworkAccess = true
        configuration.networkServiceType = .responsiveData
        configuration.waitsForConnectivity = true
        configuration.httpAdditionalHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "\(accessToken)"
        ]
        configuration.urlCache = WTPCache().cacheConfiguration
    
        
        return configuration
    }
}
