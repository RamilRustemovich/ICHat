//
//  MMesage.swift
//  IChat
//
//  Created by Ramil Davletshin on 17.02.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation
import FirebaseFirestore
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct MMessage: Hashable, MessageType {
    
    var sender: SenderType //MessageType
    var messageId: String  { return id ?? UUID().uuidString }//MessageType
    var sentDate: Date //MessageType
    var kind: MessageKind { return .text(content) }//MessageType
    
    let id: String?
    let content: String
    //let senderId: String
    //let senderUsername: String
    
    var representation: [String: Any] {
        var rep: [String: Any] = ["content": content]
        rep["senderID"] = sender.senderId
        rep["senderName"] = sender.displayName
        rep["created"] = sentDate
        return rep
    }
    
    init(user: MUser, content: String) {
        self.content = content
        //senderId = user.id
        //senderUsername = user.username
        sender = Sender(senderId: user.id, displayName: user.username)
        sentDate = Date()
        id = nil
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let sentDate = data["created"] as? Timestamp,
            let senderId = data["senderID"] as? String,
            let senderName = data["senderName"] as? String,
            let content = data["content"] as? String
            else { return nil }
        
        self.sentDate = sentDate.dateValue()
        //  self.senderId = senderId
        //  self.senderUsername = senderName
        sender = Sender(senderId: senderId, displayName: senderName)
        self.content = content
        self.id = document.documentID
    }
    
    static func == (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.messageId == rhs.messageId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
    
}
