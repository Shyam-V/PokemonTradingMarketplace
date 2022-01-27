//
//  ValidationServices.swift
//  PokemonMarketplaceApp
//
//  Created by Muhammad Osama Naeem on 1/21/22.
//

import Foundation

struct ValidationServices {
    func validateEmail(email: String?) throws -> String {
        guard let email = email else {
            throw ValidationErrors.invalidValue
        }
        guard let rawEmail = EmailAddress.init(rawValue: email) else {
            throw ValidationErrors.incorrectEmail
        }
        return rawEmail.rawValue
    }
    
    func validatePassword(password: String?, confirmPassword: String?) throws -> String {
        guard let password = password, let confirmPassword = confirmPassword else {
            throw ValidationErrors.invalidValue
        }
       
        
        guard password.count >= 6 else {
            throw ValidationErrors.passwordTooShort
        }
        
        guard confirmPassword == password else {
            throw ValidationErrors.passwordNotMatch
        }

        
        return password
    }
    
}

enum ValidationErrors: LocalizedError {
    case incorrectEmail
    case passwordTooShort
    case invalidValue
    case passwordNotMatch
    
    var errorDescription: String? {
        switch self {
        case .incorrectEmail:
            return "Email address not valid"
        case .passwordTooShort:
            return "Password must be 6 characters or more"
        case .invalidValue:
            return "Invalid Value"
        case .passwordNotMatch:
            return "Password does not match"
        }
        
        
    }
}

/// Code sample from SwiftBySundell (https://www.swiftbysundell.com/articles/validating-email-addresses/)
struct EmailAddress: RawRepresentable, Codable {
    let rawValue: String
    init?(rawValue: String) {
        let detector = try? NSDataDetector( types: NSTextCheckingResult.CheckingType.link.rawValue)
        let range = NSRange(rawValue.startIndex..<rawValue.endIndex,in: rawValue)
        
        let matches = detector?.matches(
                    in: rawValue,
                    options: [],
                    range: range
                )
        
        guard let match = matches?.first, matches?.count == 1 else {
                    return nil
                }

        guard match.url?.scheme == "mailto", match.range == range else {
            return nil
        }

        self.rawValue = rawValue
    }
}
