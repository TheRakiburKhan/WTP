//
//  PhotoSource.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation

struct PhotoSource: Hashable {
    let original: URL?
    let large: URL?
    let medium: URL?
    let small: URL?
    let potrait: URL?
    let landscape: URL?
}
