//
//  FirestoreService.swift
//  IChat
//
//  Created by Ramil Davletshin on 08.02.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation
import FirebaseFirestore


final class FirestoreService {
    
    static let shared = FirestoreService()
    private init() { }
    
    let db = Firestore.firestore()
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void ) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notField))
            return
        }
        
        let muser = MUser(username: username!, email: email, description: description!, sex: sex!, avatarStringURL: "", id: id)
        
        self.usersRef.document(muser.id).setData(muser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
        
        
        
    }
    
    
    
}
