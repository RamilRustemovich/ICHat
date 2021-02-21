//
//  MMesage.swift
//  IChat
//
//  Created by Ramil Davletshin on 17.02.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct MMesage: Hashable {
    let content: String
    let senderId: String
    let senderUsername: String
    let sendDate: Date
    let id: String?
    
    var representation: [String: Any] {
        var rep: [String: Any] = ["content": content]
          rep["senderID"] = senderId
          rep["senderName"] = senderUsername
          rep["created"] = sendDate
          return rep
    }
    
    init(user: MUser, content: String) {
        self.content = content
        senderId = user.id
        senderUsername = user.username
        sendDate = Date()
        id = nil
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let sendDate = data["created"] as? Timestamp,
            let senderId = data["senderID"] as? String,
            let senderName = data["senderName"] as? String,
            let content = data["content"] as? String
            else { return nil }
        
        self.sendDate = sendDate.dateValue()
        self.senderId = senderId
        self.senderUsername = senderName
        self.content = content
        self.id = document.documentID
    }
    
}
