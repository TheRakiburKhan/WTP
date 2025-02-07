//
//  CodableDataModelBase.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import UIKit

class CodableDataModelBase: NSObject {
    
    struct CodableResponseRootModel<T: Decodable>: Decodable {
        let page: Int
        let perPage: Int
        let photos: T?
        let nextPage: String?
        let previousPage: String?
        
        private enum CodingKeys: String, CodingKey {
            case page
            case perPage = "per_page"
            case photos
            case nextPage = "next_page"
            case previousPage = "prev_page"
        }
        
        init(from decoder: Decoder) throws {
            let coded = try decoder.container(keyedBy: CodingKeys.self)
            
            page = try coded.decode(Int.self, forKey: .page)
            perPage = try coded.decode(Int.self, forKey: .perPage)
            nextPage = try coded.decodeIfPresent(String.self, forKey: .nextPage)
            previousPage = try coded.decodeIfPresent(String.self, forKey: .previousPage)
            
            do {
                photos = try coded.decodeIfPresent(T.self, forKey: .photos)
            } catch {
                print("Error: Made Data nil \(error)")
                self.photos = nil
            }
        }
    }
}
