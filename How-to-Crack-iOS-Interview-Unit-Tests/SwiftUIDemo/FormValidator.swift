//
//  FormValidator.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 5/24/24.
//

import Foundation

enum FormValidator {
    static func enableCreateAccount(email: String, phone: String, password: String) -> Bool {
        return !email.isEmpty && !phone.isEmpty && !password.isEmpty
    }
    
    static func validateEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }
    
    static func validatePhone(_ phone: String) -> Bool {
        let regex = "^\\+?[0-9]{6,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: phone)
    }
    
    static func validatePassword(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    // Example asynchronous function to test
    static func fetchData(completion: @escaping (Data?) -> Void) {
           // Simulate an asynchronous task (e.g., fetching data from a server)
           DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
               // Simulate receiving data
               let data = "Test data".data(using: .utf8)
               
               // Call the completion handler with the received data
               completion(data)
           }
       }
}
