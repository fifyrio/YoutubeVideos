//
//  CarModel.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 5/27/24.
//

import Foundation

struct CarModel: Codable, Identifiable {
    var id: String    
    var imageUrl: String
    var modelType: String
    var price: String
    var date: String
}
