//
//  Environment.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation

enum Environment {
    case apiKey
    
    var value: String {
        Keys.apiKey.retreveKey()
    }
}

private enum Keys: String {
    case apiKey = "API Key"
    
    func retreveKey() -> String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: self.rawValue) as? String else {return "No value found"}
        
        return apiKey
        
    }
}
