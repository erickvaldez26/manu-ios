//
//  LoginScreen.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    @ObservedObject var viewModel = LoginViewModel(
        useCases: LoginUseCasesImpl(
            repository: LoginRepositoryImpl(
                dataSource: LoginDataSourceImpl()
            )
        )
    )
    
    var body: some View {
        Color(uiColor: UIColor(named: "primaryColor")!)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    LoginTopBar()
                    
                    Spacer()
                    Text(verbatim: "Controla tus gatos,\ncontrola tu vida")
                        .styleDefaultFont(type: .bold, size: 22)
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    if let messageError = viewModel.errorMessage {
                        Text(verbatim: messageError)
                            .styleDefaultFont(type: .regular, size: 14)
                            .foregroundStyle(.red)
                            .padding(.top, 4)
                            .padding(.bottom, 16)
                            .padding(.horizontal, 16)
                            .multilineTextAlignment(.leading)
                            .frame(height: 65)
                    } else {
                        Text(verbatim: "")
                        .styleDefaultFont(type: .regular, size: 14)
                        .foregroundStyle(.black)
                        .padding(.top, 4)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                        .multilineTextAlignment(.leading)
                        .frame(height: 65)
                    }
                    
                    ManuTextField(placeholder: "Correo electrónico", keyboardType: .emailAddress, text: $viewModel.email) { _ in
                        viewModel.validateEmail()
                    }.disabled(viewModel.isLoading)
                    ManuSecureField(placeholder: "Contraseña", text: $viewModel.password) { _ in
                        viewModel.validatePassword()
                    }.disabled(viewModel.isLoading)
                    
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {}, label: {
                            Image(systemName: "faceid")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color("lightGray"))
                        })
                        
                        MButton(title: "Ingresar", action: {
                            viewModel.login()
                        }, state: viewModel.isLoading ? .loading : viewModel.isFormValid)
                        .frame(width: (UIScreen.main.bounds.width - 32) - 44, height: 50)
                    }
                    
                    HStack {
                        Text(verbatim: "Aún no te registraste?")
                            .styleDefaultFont(type: .regular, size: 14)
                        
                        Button {
                            appCoordinator.push(.register)
                        } label: {
                            Text(verbatim: "Regístrate aqui")
                                .styleDefaultFont(type: .bold, size: 14)
                                .foregroundColor(Color("accentLightGray"))
                        }.disabled(viewModel.isLoading)
                    }.padding(.vertical, 26)
                }.onReceive(viewModel.$loginSuccess) { success in
                    if success {
                        appCoordinator.push(.tabBar)
                    }
                }
            }
    }
}
