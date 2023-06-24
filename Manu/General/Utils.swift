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
