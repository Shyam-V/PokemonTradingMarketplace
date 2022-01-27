//
//  ValidationServicesTests.swift
//  ValidationServicesTests
//
//  Created by Muhammad Osama Naeem on 1/21/22.
//

@testable import PokemonMarketplaceApp
import XCTest


class ValidationServicesTests: XCTestCase {

    var validation: ValidationServices!
    
    override func setUp() {
        super.setUp()
        validation = ValidationServices()
        
    }
    
    override func tearDown() {
        super.tearDown()
        validation = nil
    }
    
    func test_is_valid_emailAddress() throws {
        XCTAssertNoThrow(try validation.validateEmail(email: "onaeem26@gmail.com"))
    }
    
    func test_is_emailAddress_nil() throws {
        XCTAssertThrowsError(try validation.validateEmail(email: nil))
    }
    
    func test_is_valid_password() throws {
        XCTAssertNoThrow(try validation.validatePassword(password: "12331", confirmPassword: "12331"))
    }
    
    func test_is_nil_password() throws {
        XCTAssertThrowsError(try validation.validatePassword(password: "12221", confirmPassword: nil))
    }
    
}
