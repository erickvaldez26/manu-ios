//
//  LoginDataSource.swift
//  Manu
//
//  Created by Erick Valdez on 13/04/25.
//

import Combine
import FirebaseAuth

protocol LoginDataSource: AnyObject {
    func signInWithEmail(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error>
}

class LoginDataSourceImpl: LoginDataSource {
    func signInWithEmail(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error> {
        Future<AuthDataResult?, Error> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                promise(.success(authResult))
            }
        }.eraseToAnyPublisher()
    }
}
