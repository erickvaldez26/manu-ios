//
//  FormLoginView.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct FormEnrollmentView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Button(action: {}, label: {
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color("lightGray"))
            })
            
            Button(action: {}, label: {
                Text(verbatim: "Ingresar")
                    .styleDefaultFont(type: .regular, size: 16)
                    .foregroundStyle(Color.white)
            })
            .frame(width: (UIScreen.main.bounds.width - 32) - 44, height: 50)
            .background(Color("accentLightGray").opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .disabled(true)
        }
    }
}

#Preview {
    FormEnrollmentView()
}
