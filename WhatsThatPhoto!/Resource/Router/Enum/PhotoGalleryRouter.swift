//
//  PhotoGalleryRouter.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 08/02/2025.
//

import Foundation

enum PhotoGalleryRouter: RouterProtocol {
    case gallery
    case photo(photo: Photo)
    
    var stepIndex: Int {
        switch self {
            case .gallery:
                return 0
            case .photo:
                return 1
        }
    }
}

extension PhotoGalleryRouter {
    static func == (lhs: PhotoGalleryRouter, rhs: PhotoGalleryRouter) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(stepIndex)
    }
}
