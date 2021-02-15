//
//  UserError.swift
//  IChat
//
//  Created by Ramil Davletshin on 08.02.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation


enum UserError {
    case notField
    case photoNotExist
    case cannotGetUserInfo
    case cannotUnwrapToMUser
}


extension UserError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .notField:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Невозможно загрузить информацию о User из Firebase", comment: "")
        case .cannotUnwrapToMUser:
            return NSLocalizedString("Невозможно конвертировать MUser из User", comment: "")
        }
    }
    
}
