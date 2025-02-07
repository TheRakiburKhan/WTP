//
//  Environment.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation

enum Environment {
    case apiKey
    case loggingSubsystem
    
    var value: String {
        switch self {
            case .apiKey:
                return Keys.apiKey.retreveKey()
                
            case .loggingSubsystem:
                return Keys.identifier.retreveKey()
        }
    }
}

private enum Keys: String {
    case apiKey = "API Key"
    case identifier = "Bundle Identifier"
    
    func retreveKey() -> String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: self.rawValue) as? String else {return "No value found"}
        
        return apiKey
        
    }
}
