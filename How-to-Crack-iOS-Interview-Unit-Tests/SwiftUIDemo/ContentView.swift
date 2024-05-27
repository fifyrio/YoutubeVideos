//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 2023/12/6.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                } header: {
                    Text("Email")
                } footer: {
                    Text(viewModel.emailPromt)
                        .foregroundColor(.red)
                }
                
                Section {
                    TextField("Phone", text: $viewModel.phone)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                } header: {
                    Text("Phone")
                } footer: {
                    Text(viewModel.phonePromt)
                        .foregroundColor(.red)
                }
                
                Section {
                    SecureField("Password", text: $viewModel.password)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                } header: {
                    Text("Password")
                } footer: {
                    Text(viewModel.passwordPromt)
                        .foregroundColor(.red)
                }

                Button(action: {
                    
                }, label: {
                    Text("Create")
                })
                .disabled(!viewModel.enableCreateAccount)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
