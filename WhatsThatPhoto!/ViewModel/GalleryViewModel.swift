//
//  GalleryViewModel.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation

class GalleryViewModel: ObservableObject {
    @Published var photos: [Int] = []
    
    private let apiService: PhotoAPIService = .init()
    
    func fetchPhotos() async {
        let response = await apiService.dashboardData(page: 1, perPage: 15)
        
        switch response {
            case .success(let success):
                print(success.count)
            case .failure(let failure):
                print(failure)
        }
    }
}
