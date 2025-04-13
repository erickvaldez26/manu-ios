//
//  RegisterRepository.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import Foundation
import FirebaseAuth
import Combine

protocol RegisterRepository: AnyObject {
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<AuthDataResult?, Error>
}
