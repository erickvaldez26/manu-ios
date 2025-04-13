//
//  ManuSecureField.swift
//  Manu
//
//  Created by Erick Valdez on 6/04/25.
//

import SwiftUI
import Combine

struct ManuSecureField: View {
    let placeholder: String
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var onTextChanged: (String) -> Void
    
    var body: some View {
        SecureField(placeholder, text: bindingWithChangeHandler())
            .focused($isFocused)
            .font(.styleDefaultFont(type: .regular, size: 14))
            .foregroundColor(Color.black)
            .padding()
            .textInputAutocapitalization(.never)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .stroke(Color("accentLightGray"))
                    .opacity(isFocused ? 1 : 0.4)
            )
            .cornerRadius(10)
            .padding(.horizontal)
            .tint(Color("accentLightGray", bundle: nil))
    }
    
    private func bindingWithChangeHandler() -> Binding<String> {
        return Binding(
            get: { self.text },
            set: { newValue in
                self.text = newValue
                self.onTextChanged(newValue)
            }
        )
    }
}
