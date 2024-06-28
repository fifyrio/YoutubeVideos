//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                let dataFetcher = DataFetcher()
                let data = await dataFetcher.fetchData()
            }
        }, label: {
            Text("Button")
        })
    }
}

#Preview {
    ContentView()
}
