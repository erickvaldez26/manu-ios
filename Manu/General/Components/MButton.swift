//
//  MButton.swift
//  Manu
//
//  Created by Erick Valdez on 12/04/25.
//

import SwiftUI

struct MButton: View {
    var title: String
    var action: () -> Void
    var isEnabled: Bool
    
    var body: some View {
        Button(action: action) {
            Text(verbatim: title)
                .styleDefaultFont(type: .regular, size: 16)
                .foregroundStyle(isEnabled ? Color.white : Color.white.opacity(0.7))
                .frame(maxWidth: .infinity)
                
        }
        .buttonStyle(MButtonStyle())
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1.0 : 0.8)
    }
}

struct MButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                Color("accentLightGray")
            )
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

#Preview {
    MButton(title: "MButton", action: {}, isEnabled: false)
}
