//
//  FormLoginView.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct FormLoginView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Button(action: {}, label: {
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color("lightGray"))
            })
            
            MButton(title: "Ingresar", action: {
                
            }, isEnabled: false)
            .frame(width: (UIScreen.main.bounds.width - 32) - 44, height: 50)
        }
    }
}
