//
//  User.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/18/24.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
