//
//  FormValidatorTests.swift
//  SwiftUIDemoTests
//
//  Created by 吴伟 on 5/27/24.
//

import XCTest
@testable import SwiftUIDemo

final class FormValidatorTests: XCTestCase {

    func testEnableCreateAccount() {
        XCTAssertTrue(FormValidator.enableCreateAccount(email: "email", phone: "phone", password: "password"))
        XCTAssertFalse(FormValidator.enableCreateAccount(email: "", phone: "", password: ""))
    }

    
    func testValidateEmail() {
        XCTAssertTrue(FormValidator.validateEmail("willwu@gmail.com"))
        XCTAssertFalse(FormValidator.validateEmail("willwugmail.com"))
    }
    
    func testValidatePhone() {
        XCTAssertTrue(FormValidator.validatePhone("+861883232323"))
        XCTAssertFalse(FormValidator.validatePhone("8236"))
    }
    
    func testValidatePassword() {
        XCTAssertTrue(FormValidator.validatePassword("12345678"))
        XCTAssertFalse(FormValidator.validatePassword("123456"))
    }
    
    func testFetchData() {
        let exp = XCTestExpectation(description: "test Fetch Data")
        FormValidator.fetchData { data in
            XCTAssertNotNil(data)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
