//
//  NavigationStyle.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import Foundation
import SwiftUI

enum Screen: Identifiable, Hashable {
    case login
    case register
    case tabBar
    
    var id: Self { return self }
}

enum Sheet: Identifiable, Hashable {
    case register
    
    var id: Self { return self }
}

enum FullScreenCover: Identifiable, Hashable {
    case calculatorExpense
    
    var id: Self { return self }
}

extension FullScreenCover {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .calculatorExpense:
            hasher.combine("addDebt")
        }
    }
    
    static func == (lhs: FullScreenCover, rhs: FullScreenCover) -> Bool {
        switch (lhs, rhs) {
        case (.calculatorExpense, .calculatorExpense):
            return true
        }
    }
}


enum CustomTabBarRoute: Identifiable, Hashable {
    case home
    
    var id: Self { return self }
}
