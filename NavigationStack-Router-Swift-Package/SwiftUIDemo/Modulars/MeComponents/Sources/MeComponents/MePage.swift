//
//  MePage.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/21/24.
//

import SwiftUI
import Env

public struct MePage: View {
    
//    @Binding var path: [RouterDestination]
    @EnvironmentObject private var routerPath: RouterPath
    
    public init() {
    }
    
    public var body: some View {
        VStack{
            Text("Me Page")
            Button("Me Detail") {
                routerPath.navigate(to: .meDetail(id: "123"))
            }
        }
        .navigationTitle("Me")
    }
}
