//
//  CustomComponents.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct ManuTextField: View {
    let placeholder: String
    @State var text: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField(placeholder, text: $text)
            .focused($isFocused)
            .font(.styleDefaultFont(type: .regular, size: 14))
            .foregroundColor(Color.black)
            .padding()
            .textInputAutocapitalization(.never)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .stroke(isFocused ? Color("accentLightGray", bundle: nil) : Color.black)
                    .opacity(isFocused ? 1 : 0.4)
            )
            .cornerRadius(10)
            .padding(.horizontal)
            .tint(Color("accentLightGray", bundle: nil))
    }
}

struct ManuSecureField: View {
    let placeholder: String
    @State var text: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .focused($isFocused)
            .font(.styleDefaultFont(type: .regular, size: 14))
            .foregroundColor(Color.black)
            .padding()
            .textInputAutocapitalization(.never)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .stroke(isFocused ? Color("accentLightGray") : Color.black)
                    .opacity(isFocused ? 1 : 0.4)
            )
            .cornerRadius(10)
            .padding(.horizontal)
            .tint(Color("accentLightGray", bundle: nil))
    }
}

struct CustomComponents_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ManuTextField(placeholder: "Placeholder", text: "")
        }
    }
}
