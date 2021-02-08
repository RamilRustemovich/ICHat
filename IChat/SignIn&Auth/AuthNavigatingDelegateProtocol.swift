//
//  AuthNavigatingDelegateProtocol.swift
//  IChat
//
//  Created by Ramil Davletshin on 07.02.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation


protocol AuthNavigatingDelegate: class {
    func toLoginVC()
    func toSignUpVC()
}
