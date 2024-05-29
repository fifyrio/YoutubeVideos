//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel: CarListViewModel = CarListViewModel(api: CarAPIServer())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataList, id: \.id) { item in
                    CarCellView(viewModel: item)
                }
            }
            .refreshable {
                await viewModel.fetchCars()
            }
        }
        .padding()
        .onAppear {
            Task {
                await viewModel.fetchCars()
            }
        }
    }
}

#Preview {
    ContentView()
}
