//
//  GalleryView.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 07/02/2025.
//

import SwiftUI

struct GalleryView: View {
    @StateObject private var viewModel: GalleryViewModel = .init()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(viewModel.photos, id: \.self) { photo in
                AsyncImage(url: photo.sources.medium) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                        .background(photo.avgColor)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                }
                .onTapGesture {
                    Router.pushValueToNavigation(PhotoGalleryRouter.photo(photo: photo))
                }
                .onAppear {
                    if photo == viewModel.photos.last {
                        Task {
                            await viewModel.fetchData()
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchData()
        }
        
    }
}

#Preview {
    GalleryView()
}
