//
//  MChat.swift
//  IChat
//
//  Created by Ramil Davletshin on 20.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct MChat: Hashable, Decodable {
    var friendUsername: String
    var friendUserAvatarStringURL: String
    var lastMessageContent: String
    var friendId: String
    
    var representation: [String: Any] {
        var rep = ["friendUsername": friendUsername]
        rep["friendUserAvatarStringURL"] = friendUserAvatarStringURL
        rep["lastMessage"] = lastMessageContent
        rep["friendId"] = friendId
        return rep
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let friendUsername = data["friendUsername"] as? String,
            let friendUserAvatarStringURL = data["friendUserAvatarStringURL"] as? String,
            let lastMessageContent = data["lastMessage"] as? String,
            let friendId = data["friendId"] as? String
            else { return nil }
        
        self.friendUsername = friendUsername
        self.friendUserAvatarStringURL = friendUserAvatarStringURL
        self.lastMessageContent = lastMessageContent
        self.friendId = friendId
    }
    
    init(friendUsername: String, friendUserAvatarStringURL: String, lastMessageContent: String, friendId: String) {
        self.friendUsername = friendUsername
        self.friendUserAvatarStringURL = friendUserAvatarStringURL
        self.lastMessageContent = lastMessageContent
        self.friendId = friendId
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}

