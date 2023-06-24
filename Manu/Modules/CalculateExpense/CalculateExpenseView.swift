//
//  CalculateExpenseView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import Foundation
import SwiftUI

struct CalculateExpenseView: View {
    var body: some View {
        Color(uiColor: UIColor(named: "accentGray")!)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    CalculateSpentTopBar()
                    
                    CardCalculateAndInfoView()
                        .padding(.top, 16)
                    
                    CardValidateRiskView()
                    
                    KeybaordView()
                    
                    AddSpentButton()
                }
            }.navigationBarBackButtonHidden(true)
    }
}

struct CalculateExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateExpenseView()
    }
}

