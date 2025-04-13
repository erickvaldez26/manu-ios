//
//  ManuTextField.swift
//  Manu
//
//  Created by Erick Valdez on 6/04/25.
//

import SwiftUI
import UIKit
import Combine

struct ManuTextField: View {
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var onTextChanged: (String) -> Void
    
    var body: some View {
        TextField(placeholder, text: bindingWithChangeHandler())
            .focused($isFocused)
            .font(.styleDefaultFont(type: .regular, size: 14))
            .foregroundColor(Color.black)
            .keyboardType(keyboardType)
            .textInputAutocapitalization(.never)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .stroke(Color("accentLightGray", bundle: nil))
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
