//
//  API.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation
import RKAPIUtility
import OSLog

protocol API: CodableDataModelBase {
    func parseResponse<T: Decodable>(from url: URL?, additionalHeader: [Header]?, decoder: JSONDecoder, logger: Logger?) async throws -> T?
}

extension API {
    func parseResponse<T: Decodable>(from url: URL?, additionalHeader: [Header]? = nil, decoder: JSONDecoder = .init(), logger: Logger? = nil) async throws -> T? {
        do {
            let reply = try await rkapiService.fetchItems(urlLink: url, additionalHeader: additionalHeader)
            
            guard let rawData = reply.data else { throw reply.response }
            
            guard reply.response.responseType == .success else {
                if let logger = logger {
                    logger.trace("Data: \(String(decoding: rawData, as: UTF8.self))\nResponse: \(reply.response)")
                }
                
                throw reply.response
            }
            
            let data = try decoder.decode(T.self, from: rawData)
            
            return data
        } catch {
            if let logger = logger {
                logger.error("\(error)")
            }
            
            throw error
        }
    }
    
}
