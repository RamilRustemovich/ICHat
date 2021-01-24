//
//  MUser.swift
//  IChat
//
//  Created by Ramil Davletshin on 20.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

//import Foundation

struct MUser: Hashable, Decodable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter, !filter.isEmpty else { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
