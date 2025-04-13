//
//  TabBarCoordinator.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import Foundation
import SwiftUI

class TabBarCoordinator: TabBarCoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    @Published var selectedTab: CustomTabBarRoute = .home
    
    
    // MARK: - Presentation Style Providers
    @ViewBuilder
    func build(_ route: CustomTabBarRoute) -> some View {
        switch route {
        case .home:
            BalanceView()
        }
    }
}
