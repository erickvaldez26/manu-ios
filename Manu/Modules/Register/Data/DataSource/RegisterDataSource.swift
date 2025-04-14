//
//  RegisterDataSource.swift
//  Manu
//
//  Created by Erick Valdez on 4/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine

protocol RegisterDataSource: AnyObject {
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<AuthDataResult?, Error>
}

class RegisterDataSourceImpl: RegisterDataSource {
    let db = Firestore.firestore()
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<AuthDataResult?, Error> {
        Future<AuthDataResult?, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                guard let userUID = authResult?.user.uid else {
                    promise(.failure(NSError(domain: "GENERIC", code: 500, userInfo: nil)))
                    return
                }
                
                let userData: [String: Any] = [
                    "name": name,
                    "email": email
                ]
                
                self.db.collection("users").document(userUID).setData(userData) { error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(authResult))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
