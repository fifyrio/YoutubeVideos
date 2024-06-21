//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI
import Env
import Root

@main
struct SwiftUIDemoApp: App {
    
    @StateObject private var routerPath = RouterPath()
    
    var body: some Scene {
        WindowGroup {
            RootView()            
                .environmentObject(routerPath)
        }
    }
}
