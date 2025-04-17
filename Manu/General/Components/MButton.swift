//
//  MButton.swift
//  Manu
//
//  Created by Erick Valdez on 12/04/25.
//

import SwiftUI

public enum MButtonState {
    case enabled
    case disabled
    case loading
}

struct MButton: View {
    var title: String
    var action: () -> Void
    var state: MButtonState
    
    var body: some View {
        Button(action: {
            if self.state == .enabled {
                action()
            }
        }) {
            if state == .loading {
                ProgressView()
                    .tint(Color.white)
                    .frame(maxWidth: .infinity)
            } else {
                Text(verbatim: title)
                    .styleDefaultFont(type: .regular, size: 16)
                    .foregroundStyle(state == .enabled ? Color.white : Color.white.opacity(0.7))
                    .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(MButtonStyle())
        .disabled(state == .disabled || state == .loading)
        .opacity(state == .enabled ? 1.0 : 0.8)
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
    VStack(spacing: 18) {
        MButton(title: "MButton", action: {}, state: .disabled)
        MButton(title: "MButton", action: {}, state: .enabled)
        MButton(title: "MButton", action: {}, state: .loading)
    }.padding()
}
