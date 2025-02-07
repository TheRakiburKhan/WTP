//
//  LoggingSystem.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation
import OSLog

enum LoggingSystem {
    static let ui = Logger(category: .uiFlow)
    static let data = Logger(category: .dataFlow)
    static let home = Logger(category: .home)
    static let gallary = Logger(category: .gallary)
}
