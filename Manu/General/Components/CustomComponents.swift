//
//  CustomComponents.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    let isLight: Bool
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(text.isEmpty ? placeholder : "")
                .foregroundColor(isLight ? Color.white : Color.black)
                .offset(y: self.text.isEmpty ? 0 : -25)
                .scaleEffect(self.text.isEmpty ? 1 : 0.9)
                .font(.system(size: 14))
                .opacity(0.7)
            
            TextField("", text: $text)
                .foregroundColor(isLight ? Color.white : Color.black)
        }.padding()
        .textInputAutocapitalization(.never)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isLight ? Color.white : Color.black).opacity(0.7)
        )
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct CustomComponents_Previews: PreviewProvider {
    @State private var text: String = ""
    
    static var previews: some View {
        VStack {
            CustomTextField(placeholder: "Placeholder", isLight: false, text: .constant("Hola"))
        }
    }
}
