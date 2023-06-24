//
//  WhoDoYouOweView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import Foundation
import SwiftUI

struct WhoDoYouOweView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: "A quien le debes?")
                .foregroundColor(.black)
                .styleDefaultFont(type: .medium, size: 16)
                .padding(.bottom, 14)
                .padding(.leading, 16)
            
            HStack {
                Button {
                    print("Aquiiii")
                } label: {
                    VStack {
                        ZStack {
                            Rectangle().frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(14)
                            
                            Image(systemName: "plus").foregroundColor(.black)
                        }
                    }
                }
                
                ScrollView(.horizontal) {
                    HStack(alignment: .center) {
                        ForEach(1...10, id: \.self) { item in
                            NavigationLink(destination: DetailsHowMuchOwe(arrugaDetail: SmallLoan(id: 0, personName: "Giam", hasYape: true, hasPlin: false, phoneNumber: "987654321", interbankAccountNumber: "11233143543-342-324-22", loans: [Loan(id: 0, amount: 12.0, initDate: "17/06/2023", expirationDate: "28/06/2023")]))) {
                                VStack {
                                    ZStack {
                                        Rectangle().frame(width: 60, height: 60)
                                            .foregroundColor(Color("accentGreen"))
                                            .cornerRadius(14)
                                        
                                        Text(verbatim: "JC")
                                            .foregroundColor(.black)
                                            .styleDefaultFont(type: .bold, size: 18)
                                    }
                                    
                                    Text(verbatim: "Jessica")
                                        .foregroundColor(.black)
                                        .styleDefaultFont(type: .light, size: 13)
                                }
                            }
                        }
                    }
                }
            }.padding(.leading, 16)
        }.frame(width: UIScreen.main.bounds.size.width)
            .ignoresSafeArea()
    }
}
