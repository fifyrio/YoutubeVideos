//
//  MeTab.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/21/24.
//

import SwiftUI
import Env
import MeComponents

@MainActor
struct MeTab: View {
    @EnvironmentObject private var routerPath: RouterPath
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            MePage()
                .withAppRouter()
        }
        .tabItem {
            Label("Me", systemImage: "person")
        }
    }
}
