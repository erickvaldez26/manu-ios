//
//  RegisterScreen.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct RegisterScreen: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var acceptTermConditions: Bool = false
    
    var body: some View {
        Color(uiColor: UIColor(named: "primaryColor")!)
            .ignoresSafeArea()
            .overlay {
                VStack(alignment: .leading) {
                    RegisterTopBar()
                        .padding(.horizontal, 8)
                    
                    Text(verbatim: "Por favor, ingresa tu nombre, correo electrónico\ny contraseña para registrarte.")
                        .styleDefaultFont(type: .regular, size: 14)
                        .padding(.top, 4)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                        .multilineTextAlignment(.leading)
                    
                    ManuTextField(placeholder: "Nombre", text: name)
                    ManuTextField(placeholder: "Correo electrónico", text: email)
                    ManuSecureField(placeholder: "Contraseña", text: password)
                    
                    Spacer()
                    
                    HStack {
                        Toggle(isOn: $acceptTermConditions, label: {})
                            .toggleStyle(iOSCheckbotToggleStyle())
                            .foregroundStyle(Color("lightGray"))
                        
                        Group {
                            Text(verbatim: "He leído y acepto la ")
                                .styleDefaultFont(type: .regular, size: 14) +
                            Text(verbatim: "Política de privacidad")
                                .styleDefaultFont(type: .bold, size: 14)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    
                    Button(action: {}, label: {
                        Text(verbatim: "Confirmar")
                            .styleDefaultFont(type: .regular, size: 16)
                            .foregroundStyle(Color.white)
                    })
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(Color("accentLightGray").opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 6)
                    .padding(.horizontal, 16)
                    .disabled(true)
                }
            }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RegisterScreen()
}
