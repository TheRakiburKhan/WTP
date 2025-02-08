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
        Button {
            Task {
                await viewModel.fetchPhotos()
            }
        } label: {
            Text("Hello, World!")
        }
    }
}

#Preview {
    GalleryView()
}
