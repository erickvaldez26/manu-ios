//
//  RegisterUseCases.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import Foundation
import FirebaseAuth
import Combine

protocol RegisterUseCases: AnyObject {
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<Result<RegisterModel, MANURequestError>, Never>
}

class RegisterUseCasesImpl: RegisterUseCases {
    private let repository: RegisterRepository
    
    init(repository: RegisterRepository) {
        self.repository = repository
    }
    
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<Result<RegisterModel, MANURequestError>, Never> {
        return repository.registerUser(name: name, email: email, password: password)
            .map { response in
                let mapperRegisterModel = RegisterModel(
                    uid: response?.user.uid ?? "",
                    displayName: response?.user.displayName,
                    username: response?.additionalUserInfo?.username,
                    isNewUser: response?.additionalUserInfo?.isNewUser ?? false,
                    accessToken: response?.credential?.accessToken
                )
                return .success(mapperRegisterModel)
            }
            .catch { error -> Just<Result<RegisterModel, MANURequestError>> in
                return Just(.failure(MANURequestError(from: error)))
            }
            .eraseToAnyPublisher()
    }
}
