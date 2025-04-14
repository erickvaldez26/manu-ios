//
//  AppCoordinatorImpl.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import Foundation
import SwiftUI

class AppCoordinatorImpl: AppCoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    // MARK: - Navigation Functions
    func resetToRoot() {
        path = NavigationPath()
    }
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenOver() {
        self.fullScreenCover = nil
    }
    
    // MARK: - Presentation Style Providers
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .login:
            LoginScreen().navigationBarBackButtonHidden()
        case .register:
            RegisterScreen().navigationBarBackButtonHidden()
        case .tabBar:
            TabBarView(coordinator: TabBarCoordinator()).navigationBarBackButtonHidden()
        }
    }
    
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .register:
            CalculateExpenseView()
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .calculatorExpense:
            CalculateExpenseView()
        }
    }
}
