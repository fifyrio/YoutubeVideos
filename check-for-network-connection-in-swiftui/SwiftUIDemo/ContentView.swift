//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Internet status:")
                .font(.title)
            
            Image(systemName: networkMonitor.isConnected ? "wifi" : "wifi.slash")
                .font(.title)
                .foregroundStyle(networkMonitor.isConnected ? .green : .red)
            
            Text(networkMonitor.isConnected ? "Connected" : "Disconnected")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(networkMonitor.isConnected ? .green : .red)
            
        }
        
    }
    
}


#Preview {
    ContentView()
}
