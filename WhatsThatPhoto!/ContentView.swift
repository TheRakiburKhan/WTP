//
//  ContentView.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 06/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Text("Environment Value is: \(Environment.apiKey.value)")
            
            Text("Bundle: \(Environment.loggingSubsystem.value)")
            GalleryView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
