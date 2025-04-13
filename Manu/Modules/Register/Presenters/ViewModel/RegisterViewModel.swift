//
//  RegisterViewModel.swift
//  Manu
//
//  Created by Erick Valdez on 4/04/25.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    private let useCases: RegisterUseCases
    private var cancellables = Set<AnyCancellable>()
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAcceptTermConditions: Bool = false
    @Published var errorMessage: String? = nil
    @Published var registrationSuccess: Bool = false
    
    var isNameValid: Bool = false
    var isEmailValid: Bool = false
    var isPasswordValid: Bool = false
    var isFormValid: Bool {
        return isNameValid && isEmailValid && isPasswordValid && isAcceptTermConditions
    }
    
    init(useCases: RegisterUseCases) {
        self.useCases = useCases
    }
    
    func register() {
        useCases.registerUser(name: name, email: email, password: password)
            .sink { result in
                switch result {
                case .success(let data):
                    print("MANU: El usuario se registro correctamente")
                    print("MANU: ", data)
                    DispatchQueue.main.async { [weak self] in
                        self?.registrationSuccess = true
                    }
                case .failure(let error):
                    print("MANU: Fallo el registro")
                    print("MANU: ", error)
                }
            }
            .store(in: &cancellables)
    }
    
    func validateName() {
        if name.isEmpty {
            isNameValid = false
            errorMessage = "Por favor, ingresa tu nombre."
        } else if name.containsNumbersAndSymbols() {
            isNameValid = false
            errorMessage = "El nombre no puede incluir números ni símbolos. Por favor, verifica tu entrada."
        } else {
            isNameValid = true
            errorMessage = nil
        }
    }
    
    func validateEmail() {
        if email.isEmpty {
            isEmailValid = false
            errorMessage = "El campo de correo no puede estar vacío."
        } else if !email.isValidEmail() {
            isEmailValid = false
            errorMessage = "El correo ingresado no parece válido. Asegúrate de usar el formato 'nombre@dominio.com'."
        } else {
            isEmailValid = true
            errorMessage = nil
        }
    }
    
    func validatePassword() {
        if password.isEmpty {
            isPasswordValid = false
            errorMessage = "Debes crear una contraseña para continuar."
        } else if !password.isValidPassword() {
            isPasswordValid = false
            errorMessage = "La contraseña debe tener entre 8 y 12 caracteres, incluir al menos un número y una letra mayúscula. Por favor, verifica tu entrada e inténtalo de nuevo."
        } else {
            isPasswordValid = true
            errorMessage = nil
        }
    }
}
