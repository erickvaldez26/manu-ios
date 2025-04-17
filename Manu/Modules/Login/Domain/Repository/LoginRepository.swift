//
//  LoginRepository.swift
//  Manu
//
//  Created by Erick Valdez on 13/04/25.
//

import Combine
import FirebaseAuth

class LoginRepositoryImpl: LoginRepository {
    private let dataSource: LoginDataSource
    
    init(dataSource: LoginDataSource) {
        self.dataSource = dataSource
    }
    
    func signInWithEmail(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error> {
        return dataSource.signInWithEmail(email: email, password: password)
    }
}
