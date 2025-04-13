//
//  CoordinatorView.swift
//  Manu
//
//  Created by Erick Valdez on 5/04/25.
//

import SwiftUI
import FirebaseAuth

struct CoordinatorView: View {
    @StateObject var appCoordinator: AppCoordinatorImpl = AppCoordinatorImpl()
    @State var isUserAuthenticated: Bool = Auth.auth().currentUser != nil
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(isUserAuthenticated ? .tabBar : .login)
                .navigationDestination(for: Screen.self) { screen in
                    appCoordinator.build(screen)
                }
                .sheet(item: $appCoordinator.sheet) { sheet in
                    appCoordinator.build(sheet)
                }
                .fullScreenCover(item: $appCoordinator.fullScreenCover) { fullScreenCover in
                    appCoordinator.build(fullScreenCover)
                }
        }
        .environmentObject(appCoordinator)
    }
}
