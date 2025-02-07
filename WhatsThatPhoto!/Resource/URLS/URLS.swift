//
//  URLS.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation
import RKAPIUtility
import RKAPIService

fileprivate struct Key: Decodable {
    let baseURLDebug: String
    let baseURLStaging: String
    let baseURLRelease: String
    let schemeDebug: String
    let schemeStaging: String
    let schemeRelease: String
    
    private enum CodingKeys: String, CodingKey {
        case baseURLDebug = "base_url_debug"
        case baseURLStaging = "base_url_staging"
        case baseURLRelease = "base_url_release"
        case schemeDebug = "scheme_debug"
        case schemeStaging = "scheme_staging"
        case schemeRelease = "scheme_release"
    }
}

enum URLInfoRetreaver {
    case baseURL
    case scheme
    
    var stringValue: String {
        return retreveKey(key: self)
    }
}

private func retreveKey(key: URLInfoRetreaver) -> String {
    let decoder = PropertyListDecoder()
    
    guard let url = Bundle.main.url(forResource: "URLInfo", withExtension: "plist") else {return ""}
    
    if let data = try? Data(contentsOf: url) {
        
        if let settings = try? decoder.decode(Key.self, from: data) {
            switch key {
                case .baseURL:
#if DEBUG
                    return settings.baseURLDebug
#elseif STAGING
                    return settings.baseURLStaging
#else
                    return settings.baseURLRelease
#endif
                case .scheme:
#if DEBUG
                    return settings.schemeDebug
#elseif STAGING
                    return settings.schemeStaging
#else
                    return settings.schemeRelease
#endif
            }
        }
    }
    
    return ""
}

fileprivate func buildURL(scheme: String = URLInfoRetreaver.scheme.stringValue, baseURL: String = URLInfoRetreaver.baseURL.stringValue, port: Int? = nil, path: String?, query: [URLQueryItem]? = nil) -> URL? {

    return RKAPIHelper.buildURL(scheme: scheme, baseURL: baseURL, portNo: port, path: path, queries: query)
}

@MainActor
let rkapiService: RKAPIService = RKAPIService(sessionConfiguration: .beeda(accessToken: Preferences.userAccessToken, app: .seller), delegate: nil, queue: nil)

enum URLS {
    enum Photo: Endpoint {
        case curated(page: Int, perPage: Int)
        
        var url: URL? {
            switch self {
                case .curated(let page, let perPage):
                    let query: [URLQueryItem] = [
                        .init(name: "page", value: "\(page)"),
                        .init(name: "per_page", value: "\(perPage)")
                    ]
                    
                    return buildURL(path: "v1/curated", query: query)
            }
        }
    }
}
