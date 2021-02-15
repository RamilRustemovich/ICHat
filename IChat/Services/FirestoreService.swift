//
//  FirestoreService.swift
//  IChat
//
//  Created by Ramil Davletshin on 08.02.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Firebase//Foundation
import FirebaseFirestore


final class FirestoreService {
    
    static let shared = FirestoreService()
    private init() { }
    
    let db = Firestore.firestore()
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImage: UIImage?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void ) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notField))
            return
        }
        guard avatarImage != #imageLiteral(resourceName: "avatar") else {
            completion(.failure(UserError.photoNotExist))
            return
        }
        
        StorageService.shared.upload(photo: avatarImage!) { (result) in
            switch result {
            case .success(let url):
                let muser = MUser(username: username!, email: email, description: description!, sex: sex!, avatarStringURL: url.absoluteString, id: id)
                self.usersRef.document(muser.id).setData(muser.representation) { (error) in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(muser))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        } //StorageService
        
    } //saveProfileWith
    
    func getUserData(user: User, completion: @escaping (Result<MUser, Error>) -> Void ) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let muser = MUser(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToMUser))
                    return
                }
                completion(.success(muser))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
            }
        }
    }
    
    
}
