//
//  EnrollmentScreen.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct EnrollmentScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Color(uiColor: UIColor(named: "primaryColor")!)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    EnrollmentTopBar()
                    
                    Spacer()
                    Text(verbatim: "Controla tus gatos,\ncontrola tu vida")
                        .styleDefaultFont(type: .bold, size: 22)
                        .multilineTextAlignment(.center)
                    Spacer()
                        
                    ManuTextField(placeholder: "Correo electrónico", text: email)
                    ManuSecureField(placeholder: "Contraseña", text: password)
                        
                    FormEnrollmentView()
                        
                    HStack {
                        Text(verbatim: "Aún no te registraste?")
                            .styleDefaultFont(type: .regular, size: 14)
                        NavigationLink(destination: RegisterScreen()) {
                            Text(verbatim: "Regístrate aqui")
                                .styleDefaultFont(type: .bold, size: 14)
                                .foregroundColor(Color("accentLightGray"))
                        }
                    }.padding(.vertical, 26)
                }
            }
    }
}

#Preview {
    EnrollmentScreen()
}
