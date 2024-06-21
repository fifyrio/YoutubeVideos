//
//  MeDetail.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/21/24.
//

import SwiftUI

public struct MeDetail: View {
    var data: String = ""
    
    public init(data: String = "") {
        self.data = data
    }
    
    public var body: some View {
        Text("Hello, MeDetail! \(data)")
    }
}

#Preview {
    MeDetail()
}
