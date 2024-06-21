//
//  HomePage.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/21/24.
//

import SwiftUI
import Env

public struct HomePage: View {
    
    @EnvironmentObject private var routerPath: RouterPath
    public init() {}
    public var body: some View {
        VStack{
            Text("Home Page")
            Button("Home Detail") {
                routerPath.navigate(to: .homeDetail(id: "222"))
            }

        }
        .navigationTitle("Home")
    }
}
