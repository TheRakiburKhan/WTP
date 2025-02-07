//
//  Logger.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation
import OSLog

extension Logger {
    init(category: LoggerCategory) {
        self.init(subsystem: Environment.loggingSubsystem.value, category: category.rawValue)
    }
}
