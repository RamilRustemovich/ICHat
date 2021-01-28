//
//  Validators.swift
//  IChat
//
//  Created by Ramil Davletshin on 28.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation

final class Validators {
    
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let password = password, let confirmPassword = confirmPassword, let email = email,
            password != "", confirmPassword != "", email != "" else { return false }
        
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
    
}
