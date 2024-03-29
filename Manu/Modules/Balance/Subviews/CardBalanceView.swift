//
//  CardBalanceView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct CardBalanceView: View {
    @State var isShowBalance = false
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: Constants.HomePage().balanceTotal)
                .foregroundColor(.white)
                .styleDefaultFont(type: .medium, size: 14)
                .padding([.horizontal], 20)
                .padding([.top], 25)
            
            HStack(alignment: .top) {
                Text(verbatim: isShowBalance ? "S/. 4,000.00" : "✲✲✲✲✲✲")
                    .foregroundColor(.white)
                    .styleDefaultFont(type: .bold, size: 32)
                
                Spacer()
                
                Button {
                    isShowBalance = !isShowBalance
                } label: {
                    Image(systemName: isShowBalance ? Constants.IconsName().hideBalance : Constants.IconsName().showBalance)
                        .foregroundColor(.white)
                }.padding(.top, 4)
            }
            .padding([.horizontal], 20)
            .padding(.bottom, 23)
            .padding(.top, 4)
        }
        .cornerRadius(20)
        .frame(width: UIScreen.main.bounds.size.width - 32)
        .background(Color(uiColor: UIColor(named: "accentGreen")!))
        .cornerRadius(20)
        .padding([.leading, .trailing], 16)
    }
}
