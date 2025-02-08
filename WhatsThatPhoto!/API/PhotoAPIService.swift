//
//  PhotoAPIService.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation
import SwiftUI

class PhotoAPIService: CodableDataModelBase, API {
    private var decoder: JSONDecoder
    
    override init() {
        decoder = .init()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func dashboardData(page: Int, perPage: Int) async -> Result<(photos:[Photo], nextPage: Bool), Error> {
        do {
            guard let infoTypeData: CodableResponseRootModel<[CodablePhoto]> = try await parseResponse(from: URLS.Photo.curated(page: page, perPage: perPage).url, logger: LoggingSystem.gallary) else {
                throw URLError(.unknown)
            }
            
            let returnData1: [Photo] = infoTypeData.photos?.compactMap{.init($0)} ?? []
            let returnData2: Bool = infoTypeData.nextPage != nil
            
            return .success((returnData1, returnData2))
        } catch {
            return .failure(error)
        }
    }
}

fileprivate extension CodableDataModelBase {
    struct CodablePhoto: Decodable {
        let id: Int
        let width: Int
        let height: Int
        let url: String
        let photographer: String
        let photographerURL: String
        let photographerID: Int
        let avgColor: String
        let src: CodableSrc
        let liked: Bool
        let alt: String

        enum CodingKeys: String, CodingKey {
            case id
            case width
            case height
            case url
            case photographer
            case photographerURL = "photographer_url"
            case photographerID = "photographer_id"
            case avgColor = "avg_color"
            case src
            case liked
            case alt
        }
    }
    
    struct CodableSrc: Decodable {
        let original: String
        let large2X: String
        let large: String
        let medium: String
        let small: String
        let portrait: String
        let landscape: String
        let tiny: String

        enum CodingKeys: String, CodingKey {
            case original
            case large2X = "large2x"
            case large
            case medium
            case small
            case portrait
            case landscape
            case tiny
        }
    }
}

fileprivate extension Photo {
    init(_ data: CodableDataModelBase.CodablePhoto) {
        self.init(id: data.id, width: data.width, height: data.height, photographer: data.photographer, avgColor: Color(hexString: data.avgColor), sources: .init(data.src))
    }
}

fileprivate extension PhotoSource {
    init(_ data: CodableDataModelBase.CodableSrc) {
        self.init(original: URL(string: data.original), large: URL(string: data.large), medium: URL(string: data.medium), small: URL(string: data.small), potrait: URL(string: data.portrait), landscape: URL(string: data.landscape))
    }
}
