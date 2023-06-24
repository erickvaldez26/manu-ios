//
//  AddSpentButton.swift
//  Manu
//
//  Created by Erick Valdez on 22/06/23.
//

import SwiftUI

struct AddSpentButton: View {
    var body: some View {
        Button {
            print("Gasto registrado")
        } label: {
            HStack {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                Text(verbatim: "Sumar gasto")
                    .foregroundColor(.white)
                    .styleDefaultFont(type: .medium, size: 14)
            }.frame(width: UIScreen.main.bounds.size.width - 32, height: 55)
                .background(Color("accentLightGray"))
                .cornerRadius(20)
                
        }.padding(.bottom, 2)
    }
}

struct AddSpentButton_Previews: PreviewProvider {
    static var previews: some View {
        AddSpentButton()
    }
}
