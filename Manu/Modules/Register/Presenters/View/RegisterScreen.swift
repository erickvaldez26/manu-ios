//
//  RegisterScreen.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct RegisterScreen: View {
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    @ObservedObject var viewModel = RegisterViewModel(
        useCases: RegisterUseCasesImpl(
            repository: RegisterRepositoryImpl(
                dataSource: RegisterDataSourceImpl()
            )
        )
    )

    var body: some View {
        Color(uiColor: UIColor(named: "primaryColor")!)
            .ignoresSafeArea()
            .overlay {
                VStack(alignment: .leading) {
                    RegisterTopBar()
                        .padding(.horizontal, 8)

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
                        Text(
                            verbatim:
                                "Por favor, ingresa tu nombre, correo electrónico\ny contraseña para registrarte."
                        )
                        .styleDefaultFont(type: .regular, size: 14)
                        .foregroundStyle(.black)
                        .padding(.top, 4)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                        .multilineTextAlignment(.leading)
                        .frame(height: 65)
                    }

                    ManuTextField(placeholder: "Nombre", text: $viewModel.name) { _ in
                        viewModel.validateName()
                    }
                    ManuTextField(
                        placeholder: "Correo electrónico", keyboardType: .emailAddress,
                        text: $viewModel.email
                    ) { _ in
                        viewModel.validateEmail()
                    }
                    ManuSecureField(placeholder: "Contraseña", text: $viewModel.password) { _ in
                        viewModel.validatePassword()
                    }

                    Spacer()

                    HStack {
                        Toggle(isOn: $viewModel.isAcceptTermConditions, label: {})
                            .toggleStyle(iOSCheckbotToggleStyle())
                            .foregroundStyle(Color("lightGray"))

                        Group {
                            Text(verbatim: "He leído y acepto la ")
                                .styleDefaultFont(type: .regular, size: 14)
                                + Text(verbatim: "Política de privacidad")
                                .styleDefaultFont(type: .bold, size: 14)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)

                    MButton(
                        title: "Confirmar",
                        action: {
                            viewModel.register()
                        }, state: viewModel.isFormValid ? .enabled : .disabled
                    )
                    .padding(.horizontal, 16)

                }.onReceive(viewModel.$registrationSuccess) { success in
                    if success {
                        appCoordinator.push(.tabBar)
                    }
                }
            }
    }
}
