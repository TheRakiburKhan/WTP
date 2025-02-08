//
//  URLCache.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 08/02/2025.
//

import Foundation

extension URLCache {
    var wtpCache: URLCache {
        let memoryCapacity = 50 * 1024 * 1024 // 50 MB
        let diskCapacity = 10 * 1024 * 1024 // 10 MB
        let cacheConfiguraton = WTPCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity)
        return cacheConfiguraton
    }
}
