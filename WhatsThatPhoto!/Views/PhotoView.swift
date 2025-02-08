//
//  PhotoView.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 08/02/2025.
//

import SwiftUI

struct PhotoView: View {
    @State private var currentZoom = 0.0
    @State private var totalZoom = 1.0
    
    var photo: Photo
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Clicked By,")
                    .font(.subheadline)
                Text(photo.photographer)
                    .font(.headline)
                    .bold()
            }
            .padding(.horizontl)
            
            Spacer()
            
            AsyncImage(url: photo.sources.large) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(currentZoom + totalZoom)
                    .gesture(
                        MagnifyGesture()
                            .onChanged { value in
                                currentZoom = value.magnification - 1
                            }
                            .onEnded { value in
                                totalZoom += currentZoom
                                currentZoom = 0
                            }
                    )
                    .accessibilityZoomAction { action in
                        if action.direction == .zoomIn {
                            totalZoom += 1
                        } else {
                            totalZoom -= 1
                        }
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
            }
            
            Spacer()
        }
        .navigationTitle(Text(""))
    }
}

#if DEBUG
#Preview {
    PhotoView(photo: .mock1)
}
#endif
