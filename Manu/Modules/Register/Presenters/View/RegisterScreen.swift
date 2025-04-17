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
        Color.primaryColor
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
                        Text(Constants.Localized.descriptionRegisterScreen.apply())
                        .styleDefaultFont(type: .regular, size: 14)
                        .foregroundStyle(.black)
                        .padding(.top, 4)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                        .multilineTextAlignment(.leading)
                        .frame(height: 65)
                    }

                    ManuTextField(placeholder: Constants.Localized.name.apply(), text: $viewModel.name) { _ in
                        viewModel.validateName()
                    }
                    ManuTextField(
                        placeholder: Constants.Localized.email.apply(), keyboardType: .emailAddress,
                        text: $viewModel.email
                    ) { _ in
                        viewModel.validateEmail()
                    }
                    ManuSecureField(placeholder: Constants.Localized.password.apply(), text: $viewModel.password) { _ in
                        viewModel.validatePassword()
                    }

                    Spacer()

                    HStack {
                        Toggle(isOn: $viewModel.isAcceptTermConditions, label: {})
                            .toggleStyle(iOSCheckbotToggleStyle())
                            .foregroundStyle(Color.lightGray)

                        Group {
                            Text(Constants.Localized.termConditionsPartOne.apply())
                                .styleDefaultFont(type: .regular, size: 14)
                            + Text(Constants.Localized.termConditionsPartTwo.apply())
                                .styleDefaultFont(type: .bold, size: 14)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)

                    MButton(
                        title: Constants.Localized.confirm.apply(),
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
