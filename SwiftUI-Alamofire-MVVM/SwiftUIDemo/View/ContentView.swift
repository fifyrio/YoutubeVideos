//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UsersViewModel()
        
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.username)
                        .font(.subheadline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Users")
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    ContentView()
}
