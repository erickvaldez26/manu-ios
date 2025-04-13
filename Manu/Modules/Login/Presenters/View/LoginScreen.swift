//
//  LoginScreen.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                    
                    ManuTextField(placeholder: "Correo electrónico", text: $email) { _ in
                        print("onTextChange - email")
                    }
                    ManuSecureField(placeholder: "Contraseña", text: $password) { _ in
                        print("onTextChange - pass")
                    }
                    
                    FormLoginView()
                    
                    HStack {
                        Text(verbatim: "Aún no te registraste?")
                            .styleDefaultFont(type: .regular, size: 14)

                        Button {
                            appCoordinator.push(.register)
                        } label: {
                            Text(verbatim: "Regístrate aqui")
                                .styleDefaultFont(type: .bold, size: 14)
                                .foregroundColor(Color("accentLightGray"))
                        }
                    }.padding(.vertical, 26)
                }
            }
    }
}
