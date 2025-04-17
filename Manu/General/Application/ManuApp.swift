//
//  ManuApp.swift
//  Manu
//
//  Created by Erick Valdez on 17/06/23.
//

import SwiftUI

@main
struct ManuApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView().preferredColorScheme(.light)
        }
    }
}
