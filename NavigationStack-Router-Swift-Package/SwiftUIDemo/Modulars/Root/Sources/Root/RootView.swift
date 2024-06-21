//
//  MainView.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI
import HomeComponents
import MeComponents
import Env

public struct RootView: View {
    @StateObject private var routerPath = RouterPath()

    public init() {
    }
    
    public var body: some View {
        TabView {            
            HomeTab()
            MeTab()
        }
        .environmentObject(routerPath)
    }
}

@MainActor
extension View {
    func withAppRouter() -> some View {
        navigationDestination(for: RouterDestination.self) { selection in
            switch selection {
            case  let .homeDetail(id):
                HomeDetail(data: "\(id)")
            case let .meDetail(id):
                MeDetail(data: "\(id)")
            }
        }
    }
}

#Preview {
    RootView()
}

