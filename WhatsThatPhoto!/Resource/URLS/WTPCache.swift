//
//  WTPCache.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 08/02/2025.
//

import Foundation

final class WTPCache: URLCache, @unchecked Sendable {
    private let constSecondsToKeepOnDisk = 10 * 60 // 10 minute
    
    lazy var cacheConfiguration: WTPCache = {
        let memoryCapacity = 50 * 1024 * 1024 // 50 MB
        let diskCapacity = 10 * 1024 * 1024 // 10 MB
        let cacheConfiguraton = WTPCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity)
        return cacheConfiguraton
    }()
    
    override func storeCachedResponse(_ cachedResponse: CachedURLResponse, for request: URLRequest) {
        guard ["get"].contains(request.httpMethod?.lowercased()) else { return }
        
        var customCachedResponse = cachedResponse
        
        if let response = cachedResponse.response as? HTTPURLResponse,
           var newHeaders = response.allHeaderFields as? [String: String] {
            newHeaders["Cache-Control"] = "public, max-age=\(constSecondsToKeepOnDisk)"
            newHeaders["Expires"] = nil
            newHeaders["s-maxage"] = nil
            if let url = response.url,
               // Consider only specific request
               let newResponse = HTTPURLResponse(url: url,
                                                 statusCode: response.statusCode,
                                                 httpVersion: "HTTP/1.1", headerFields: newHeaders) {
                customCachedResponse = CachedURLResponse(response: newResponse,
                                                         data: cachedResponse.data,
                                                         userInfo: cachedResponse.userInfo,
                                                         storagePolicy: cachedResponse.storagePolicy)
            }
        }
        super.storeCachedResponse(customCachedResponse, for: request)
    }
    
}
