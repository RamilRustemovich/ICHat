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

// MessageKit
struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct ImageItem: MediaItem {
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
}


struct MMessage: Hashable, MessageType {
    
    var sender: SenderType //MessageType
    var messageId: String  { return id ?? UUID().uuidString }//MessageType
    var sentDate: Date //MessageType
    var kind: MessageKind {
        if let img = image {
            let mediaItem = ImageItem(url: nil, image: nil, placeholderImage: img, size: img.size)
            return .photo(mediaItem)
        } else {
            return .text(content)
        }
    }//MessageType
    
    let id: String?
    let content: String
    var image: UIImage? = nil
    var downloadURL: URL? = nil
    //let senderId: String
    //let senderUsername: String
    
    var representation: [String: Any] {
        var rep: [String: Any] = [:]
        rep["senderID"] = sender.senderId
        rep["senderName"] = sender.displayName
        rep["created"] = sentDate
        if let url = downloadURL {
            rep["url"] = url.absoluteString
        } else {
            rep["content"] = content
        }
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
    
    init(user: MUser, image: UIImage) {
        self.image = image
        self.content = ""
        sender = Sender(senderId: user.id, displayName: user.username)
        sentDate = Date()
        id = nil
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let sentDate = data["created"] as? Timestamp,
            let senderId = data["senderID"] as? String,
            let senderName = data["senderName"] as? String
            else { return nil }
        
        self.sentDate = sentDate.dateValue()
        //  self.senderId = senderId
        //  self.senderUsername = senderName
        sender = Sender(senderId: senderId, displayName: senderName)
        self.id = document.documentID
        
        if let content = data["content"] as? String {
            self.content = content
            downloadURL = nil
        } else if let urlString = data["url"] as? String, let url = URL(string: urlString) {
            downloadURL = url
            self.content = ""
        } else {
            return nil 
        }
    }
    
    
    
    static func == (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.messageId == rhs.messageId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
    
}


extension MMessage: Comparable {
    static func < (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.sentDate < rhs.sentDate
    }
  
}
