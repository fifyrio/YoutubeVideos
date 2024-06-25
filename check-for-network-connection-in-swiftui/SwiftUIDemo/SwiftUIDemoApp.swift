//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
//    @State private var networkMonitor = NetworkMonitor()
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
