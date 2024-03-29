//
//  CustomTabBar.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import Foundation
import SwiftUI

enum ControlScreen {
    case login
    case home
    case calculateExpense
}

struct CustomTabBar: View {
    @State var selectedView: ControlScreen = .login
    @AppStorage("modalPresent") var modalPresent: String = "none"
    @AppStorage("disableScreen") var disableScreen: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                switch selectedView {
                case .login:
                    EnrollmentScreen()
                case .home:
                    BalanceView().disabled(disableScreen)
                case .calculateExpense:
                    CalculateExpenseView()
                }
                
                if selectedView == .home {
                    HStack(alignment: .bottom) {
                        Button {
                            selectedView = .home
                        } label: {
                            ZStack {
                                Circle().frame(width: 50, height: 50).foregroundColor(Color("accentGreen"))
                                Image(systemName: "creditcard.and.123").foregroundColor(.black)
                            }.padding([.leading, .top, .bottom], 6)
                        }
                        
                        NavigationLink(destination: CalculateExpenseView()) {
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
                
                if modalPresent == "failure" {
                    FailureView(isDarK: false)
                } else if modalPresent == "success" {
                    SuccessView(isDarK: false)
                }
            }.onAppear {
                disableScreen = false
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
