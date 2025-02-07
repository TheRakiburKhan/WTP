//
//  Photo.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import SwiftUI

struct Photo: Hashable {
    let id: Int
    let width: Int
    let height: Int
    let photographer: String
    let avgColor: Color
    let sources: PhotoSource    
}
