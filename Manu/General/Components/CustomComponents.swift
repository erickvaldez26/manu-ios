//
//  CustomComponents.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct ManuTextField: View {
    let placeholder: String
    @State private var isFocus: Bool = false
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { editingChanged in
            isFocus = true
        })
        .font(.styleDefaultFont(type: .regular, size: 14))
        .foregroundColor(Color.black)
        .padding()
        .textInputAutocapitalization(.never)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .stroke(isFocus ? Color("accentLightGray", bundle: nil) : Color.black)
                .opacity(isFocus ? 1 : 0.4)
        )
        .cornerRadius(10)
        .padding(.horizontal)
        .tint(Color("accentLightGray", bundle: nil))
    }
}

struct ManuSecureField: View {
    let placeholder: String
    @State private var isFocus: Bool = false
    @Binding var text: String
    
    var body: some View {
        SecureField(placeholder, text: $text, onCommit: {
            isFocus = false
        })
        .onTapGesture {
            isFocus = true
        }
        .font(.styleDefaultFont(type: .regular, size: 14))
        .foregroundColor(Color.black)
        .padding()
        .textInputAutocapitalization(.never)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .stroke(isFocus ? Color("accentLightGray") : Color.black)
                .opacity(isFocus ? 1 : 0.4)
        )
        .cornerRadius(10)
        .padding(.horizontal)
        .tint(Color("accentLightGray"))
    }
}

struct CustomComponents_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ManuTextField(placeholder: "Placeholder", text: .constant(""))
        }
    }
}
