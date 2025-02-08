//
//  GalleryViewModel.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import Foundation

class GalleryViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    
    private var currentPage: Int = 0
    private var hasNext: Bool = true
    private var perPage: Int = 15
    private var apiOnCall: Bool = false
    private let apiService: PhotoAPIService = .init()
    
    func fetchData() async {
        await fetchPhotos()
    }
    
    private func fetchPhotos() async {
        guard !apiOnCall else {return}
        guard hasNext else {return}
        
        currentPage += 1
        apiOnCall = true
        let response = await apiService.dashboardData(page: currentPage, perPage: perPage)
        apiOnCall = false
        
        switch response {
            case .success(let success):
                await MainActor.run {
                    photos.append(contentsOf: success.photos)
                    hasNext = success.nextPage
                }
            case .failure(let failure):
                LoggingSystem.gallary.debug("\(failure.localizedDescription)")
        }
    }
}
