//
//  RegisterRepository.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import Foundation
import FirebaseAuth
import Combine

class RegisterRepositoryImpl: RegisterRepository {
    private let dataSource: RegisterDataSource
    
    init(dataSource: RegisterDataSource) {
        self.dataSource = dataSource
    }
    
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<AuthDataResult?, Error> {
        return dataSource.registerUser(name: name, email: email, password: password)
    }
}
