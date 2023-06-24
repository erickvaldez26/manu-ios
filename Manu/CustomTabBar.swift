//
//  CustomTabBar.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @State var selectedView: String = "Home"
    @AppStorage("modalPresent") var modalPresent: String = "none"
    @AppStorage("disableScreen") var disableScreen: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if selectedView == "Home" {
                    BalanceView().disabled(disableScreen)
                }else if selectedView == "CalculateExpense" {
                    CalculateExpenseView()
                }
                
                HStack(alignment: .bottom) {
                    Button {
                        selectedView = "Home"
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
                }.background(.black).cornerRadius(34).position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 110)
                
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
