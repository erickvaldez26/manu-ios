//
//  BalanceView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct BalanceView: View {
    var body: some View {
        Color(uiColor: UIColor(named: "primaryColor")!)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    HeaderView()
                        .padding(.top, 4)
                    
                    CardBalanceView()
                        .padding(.top, 20)
                    
                    OperationsView()
                    
                    ScrollView {
                        VStack {
                            WhoDoYouOweView()
                                .padding(.top, 12)
                            
                            SectionMonthlyPaymentsView()
                                .padding(.top, 12)
                        }
                    }.scrollIndicators(.hidden)
                }
            }
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
