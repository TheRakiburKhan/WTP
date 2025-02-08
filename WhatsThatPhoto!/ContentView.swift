//
//  ContentView.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 06/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        WTPNavigationView {
            ScrollView {
                GalleryView()
            }
            .navigationTitle(Text("Featured Photos"))
            .navigationDestination(for: PhotoGalleryRouter.self) { route in
                switch route {
                    case .gallery:
                        GalleryView()
                        
                    case .photo(let photo):
                        PhotoView(photo: photo)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
