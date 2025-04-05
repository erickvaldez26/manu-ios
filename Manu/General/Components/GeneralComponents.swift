//
//  GeneralComponents.swift
//  Manu
//
//  Created by Erick Valdez on 17/06/23.
//

import Foundation
import SwiftUI

public enum FontType {
    case light, regular, medium, bold
}

extension Text {
    func styleDefaultFont(type: FontType, size: CGFloat) -> Text {
        switch type {
        case .light:
            return self.font(Font.custom("MontserratAlternates-Light", size: size))
        case .regular:
            return self.font(Font.custom("MontserratAlternates-Regular", size: size))
        case .medium:
            return self.font(Font.custom("MontserratAlternates-Medium", size: size))
        case .bold:
            return self.font(Font.custom("MontserratAlternates-Bold", size: size))
        }
    }
}

extension Font {
    public static func styleDefaultFont(type: FontType, size: CGFloat) -> Font {
        switch type {
        case .light:
            return Font.custom("MontserratAlternates-Light", size: size)
        case .regular:
            return Font.custom("MontserratAlternates-Regular", size: size)
        case .medium:
            return Font.custom("MontserratAlternates-Medium", size: size)
        case .bold:
            return Font.custom("MontserratAlternates-Bold", size: size)
        }
    }
}

struct iOSCheckbotToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                configuration.label
            }
        }

    }
}
