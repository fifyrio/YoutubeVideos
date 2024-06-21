//
//  File.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 6/18/24.
//

import Alamofire
import SwiftUI
import Combine

@MainActor
class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func fetchUsers() async {
        let headers: HTTPHeaders = [
            "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ3ZWJtYW4udGlueXdhbi5jbiIsImF1ZCI6IndlYm1hbi50aW55d2FuLmNuIiwiaWF0IjoxNzE4MDg3NDU0LCJuYmYiOjE3MTgwODc0NTQsImV4cCI6MTcxODY5MjI1NCwiZXh0ZW5kIjp7ImlkIjo0MCwicGFja2FnZV9pZCI6IjEifX0.ZsFqdLmCrjdJcn_MnTS_OSsHI1POoCGhjJ65UBMiiBo",
            "channel": "AppStore"
        ]
        
        do {
            let response = try await AF.request("https://jsonplaceholder.typicode.com/users", headers: headers)
                .validate()
                .serializingDecodable([User].self)
                .value
            self.users = response
        } catch {
            print("Error fetching users: \(error)")
        }
    }
}

