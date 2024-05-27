//
//  ContentViewModel.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 5/24/24.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var password: String = ""
    
    @Published var emailPromt: String = ""
    @Published var phonePromt: String = ""
    @Published var passwordPromt: String = ""
    
    @Published var enableCreateAccount: Bool = false
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest3($email, $phone, $password)
            .map { email, phone, password in
                return FormValidator.enableCreateAccount(email: email, phone: phone, password: password)
            }
            .assign(to: \.enableCreateAccount, on: self)
            .store(in: &bag)
        
        $email.sink { [weak self] value in
            guard let self = self else { return }
            if value.isEmpty {
                self.emailPromt = ""
            } else {
                self.emailPromt = FormValidator.validateEmail(value) ? "" : "Wrong email format"
            }
        }
        .store(in: &bag)
        
        $phone.sink { [weak self] value in
            guard let self = self else { return }
            if value.isEmpty {
                self.phonePromt = ""
            } else {
                self.phonePromt = FormValidator.validatePhone(value) ? "" : "Wrong phone number format"
            }
        }
        .store(in: &bag)
        
        $password.sink { [weak self] value in
            guard let self = self else { return }
            if value.isEmpty {
                self.passwordPromt = ""
            } else {
                self.passwordPromt = FormValidator.validatePassword(value) ? "" : "password length need be more than 8"
            }
        }
        .store(in: &bag)
    }
}
