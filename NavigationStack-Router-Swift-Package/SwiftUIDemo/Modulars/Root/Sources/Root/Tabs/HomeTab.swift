//
//  HomeTab.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/21/24.
//

import SwiftUI
import HomeComponents
import Env

@MainActor
struct HomeTab: View {
    @EnvironmentObject private var routerPath: RouterPath
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            HomePage()
                .withAppRouter()
        }
        .tabItem {
            Label("Home", systemImage: "house")
        }
    }
}


