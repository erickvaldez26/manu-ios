//
//  LoginRepositoryProtocol.swift
//  Manu
//
//  Created by Erick Valdez on 13/04/25.
//

import Combine
import FirebaseAuth

protocol LoginRepository: AnyObject {
    func signInWithEmail(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error>
}
