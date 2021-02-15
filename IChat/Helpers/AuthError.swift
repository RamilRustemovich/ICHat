//
//  AuthError.swift
//  IChat
//
//  Created by Ramil Davletshin on 28.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation


enum AuthError {
    case notField
    case invalidEmail
    case passwordsNotMatched
    case unknownError
    case serverError
}


extension AuthError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .notField:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Недопустимый формат почты", comment: "")
        case .passwordsNotMatched:
            return NSLocalizedString("Пароли не совпадают", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        case .serverError:
            return NSLocalizedString("Ошибка сервера", comment: "")
        }
    }
    
}
