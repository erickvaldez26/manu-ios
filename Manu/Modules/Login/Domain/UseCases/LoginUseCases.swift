//
//  LoginUseCases.swift
//  Manu
//
//  Created by Erick Valdez on 13/04/25.
//

import Foundation
import Combine
import FirebaseAuth

protocol LoginUseCases: AnyObject {
    func signInWithEmail(email: String, password: String) -> AnyPublisher<Result<AuthDataResult, MANURequestError>, Never>
}

class LoginUseCasesImpl: LoginUseCases {
    private let repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func signInWithEmail(email: String, password: String) -> AnyPublisher<Result<AuthDataResult, MANURequestError>, Never> {
        return repository.signInWithEmail(email: email, password: password)
            .map { response in
                if let response = response {
                    return .success(response)
                }
                return .failure(MANURequestError(from: NSError(domain: "GENERIC", code: 500, userInfo: nil)))
            }
            .catch { error -> Just<Result<AuthDataResult, MANURequestError>> in
                return Just(.failure(MANURequestError(from: error)))
            }
            .eraseToAnyPublisher()
    }
}
