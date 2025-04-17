//
//  LoginViewModel.swift
//  Manu
//
//  Created by Erick Valdez on 13/04/25.
//

import Combine

class LoginViewModel: ObservableObject {
    private let useCases: LoginUseCases
    private var cancellables = Set<AnyCancellable>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    @Published var loginSuccess: Bool = false
    @Published var isLoading: Bool = false
    
    var isEmailValid: Bool = false
    var isPasswordValid: Bool = false
    var isFormValid: MButtonState {
        if isEmailValid && isPasswordValid {
            return .enabled
        } else {
            return .disabled
        }
    }
    
    init(useCases: LoginUseCases) {
        self.useCases = useCases
    }
    
    func login() {
        isLoading = true
        useCases.signInWithEmail(email: email, password: password)
            .sink { result in
                self.isLoading = false
                switch result {
                case .success:
                    print("MANU: Se inicio sesion correctamente")
                    self.loginSuccess = true
                case .failure:
                    print("MANU: Fallo el login")
                    self.loginSuccess = false
                }
            }
            .store(in: &cancellables)
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
            errorMessage = "Debes ingresar una contraseña para continuar."
        } else {
            isPasswordValid = true
            errorMessage = nil
        }
    }
}
