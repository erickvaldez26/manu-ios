//
//  CustomTabBar.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @ObservedObject var coordinator: TabBarCoordinator
    
    var body: some View {
        CustomTabBar(
            selectedTab: $coordinator.selectedTab,
            homeView: {
                coordinator.build(.home) as! BalanceView
            }
        )
    }
}

struct CustomTabBar: View {
    @EnvironmentObject var appCoordinator: AppCoordinatorImpl
    @Binding var selectedTab: CustomTabBarRoute
    let homeView: () -> BalanceView
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    homeView()
                }
            }
            
            HStack(alignment: .bottom) {
                Button { selectedTab = .home } label: {
                    ZStack {
                        Circle().frame(width: 50, height: 50).foregroundColor(Color("accentGreen"))
                        Image(systemName: "creditcard.and.123").foregroundColor(.black)
                    }.padding([.leading, .top, .bottom], 6)
                }
                
                Button {
                    appCoordinator.presentFullScreenCover(.calculatorExpense)
                } label: {
                    ZStack {
                        Circle().frame(width: 50, height: 50).foregroundColor(Color("accentGray"))
                        Image(systemName: "cart.badge.questionmark").foregroundColor(.white)
                    }.padding([.top, .bottom, .trailing], 6)
                }
            }
            .background(.black)
            .cornerRadius(34)
            .position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 110)
        }
    }
}
