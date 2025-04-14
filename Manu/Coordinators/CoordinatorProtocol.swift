//
//  CoordinatorProtocol.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import Foundation
import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    
    func resetToRoot()
    func push(_ screen: Screen)
    func presentSheet(_ sheet: Sheet)
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenOver()
}

protocol TabBarCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var selectedTab: CustomTabBarRoute { get set }
}
