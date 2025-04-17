//
//  Utils.swift
//  Manu
//
//  Created by Erick Valdez on 19/06/23.
//

import Foundation
import SwiftUI

struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader(content: { proxy in
                Color.clear
                    .onAppear {
                        size = proxy.size
                    }
            })
        )
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}

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
                    .foregroundStyle(configuration.isOn ? Color("accentLightGray", bundle: nil) : Color.gray)
                configuration.label
            }
        }

    }
}

extension String {
    func containsNumbersAndSymbols() -> Bool {
        let numbersPattern = ".*[0-9].*" // Verifica si hay al menos un número
        let symbolsPattern = ".*[^a-zA-Z0-9].*" // Verifica si hay al menos un símbolo
        
        let numbersRegex = try? NSRegularExpression(pattern: numbersPattern)
        let symbolsRegex = try? NSRegularExpression(pattern: symbolsPattern)
        
        let containsNumbers = numbersRegex?.firstMatch(in: self, range: NSRange(location: 0, length: self.utf16.count)) != nil
        let containsSymbols = symbolsRegex?.firstMatch(in: self, range: NSRange(location: 0, length: self.utf16.count)) != nil
        
        return containsNumbers && containsSymbols
    }
    
    func isValidEmail() -> Bool {
        let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let regex = try? NSRegularExpression(pattern: emailPattern)
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex?.firstMatch(in: self, range: range) != nil
    }
    
    func isValidPassword() -> Bool {
        // Verificar longitud mínima y máxima
        guard self.count >= 8, self.count <= 12 else {
            return false
        }
        
        // Patrón para la validación
        let pattern = "^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9]{8,12}$"
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: self.utf16.count)
        let match = regex?.firstMatch(in: self, range: range)
        
        return match != nil
    }
}

extension StaticString {
    func localized() -> String {
        return String(localized: self, defaultValue: "Not found string")
    }
}
