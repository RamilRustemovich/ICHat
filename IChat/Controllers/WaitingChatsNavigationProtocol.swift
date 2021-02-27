//
//  AuthNavigatingDelegateProtocol.swift
//  IChat
//
//  Created by Ramil Davletshin on 20.02.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation


protocol WaitingChatsNavigation: class {
    func removeWaitingChat(chat: MChat)
    func changeToActive(chat: MChat)
}
