//
//  FruitsViewModel.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import Foundation
import SwiftUI

class FruitsViewModel: ObservableObject {
    @Published var allFruits: [Fruit] = [
        Fruit(id: 0, name: "Banana", color: "Yellow", favorite: true),
        Fruit(id: 1, name: "Apple", color: "Green", favorite: true),
        Fruit(id: 3, name: "Orange", color: "Orange", favorite: false),
        Fruit(id: 4, name: "Strawberry", color: "Red", favorite: false)
    ]
    
    @Published var showAll: Bool = false
    
    func toggleFavorite(fruit: Binding<Fruit>) {
        fruit.wrappedValue.favorite.toggle()
    }
}
