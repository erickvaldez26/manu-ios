//
//  GeneralComponents.swift
//  Manu
//
//  Created by Erick Valdez on 17/06/23.
//

import Foundation
import SwiftUI

enum FontType {
    case light, regular, medium, bold
}

extension View {
    
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
    func styleDefaultFont(type: FontType, size: CGFloat) -> Font {
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
