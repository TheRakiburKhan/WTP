//
//  Router.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 08/02/2025.
//

import SwiftUI

@MainActor
final class Router {
    static func pushValueToNavigation(_ value: any Hashable) {
        modernRouter.path.append(value)
    }
    
    static func popToRoot() {
        modernRouter.path = .init()
    }
    
    static func popView() {
        if !modernRouter.path.isEmpty {
            modernRouter.path.removeLast()
        }
    }
    
    static func popView(_ K: Int = 1) {
        guard K > 0 else {return}
        if K < modernRouter.path.count {
            modernRouter.path.removeLast(K)
        }
    }
}


@MainActor
fileprivate var modernRouter: ModernRouter = .init()

@MainActor
fileprivate class ModernRouter: ObservableObject {
    
    @Published var path = NavigationPath()
}

struct WTPNavigationView<Content>: View where Content : View {
    @StateObject private var router = modernRouter
    private var content: Content
    
    
    init(@ViewBuilder content: ()-> Content) {
        self.content = content()
    }
    
    var body: some View {
            NavigationStack(path: $router.path) {
                    content
            }
    }
}
