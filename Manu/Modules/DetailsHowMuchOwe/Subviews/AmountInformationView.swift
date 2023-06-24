//
//  AmountInformationView.swift
//  Manu
//
//  Created by Erick Valdez on 23/06/23.
//

import SwiftUI

struct AmountInformationView: View {
    @State var amount: Double
    @State var initDate: String
    @State var expirationDate: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(verbatim: "S/.")
                    .styleDefaultFont(type: .regular, size: 18)
                    .foregroundColor(.black).opacity(0.4)
                    .padding(.top, 9)
                
                Text(verbatim: String(amount))
                    .foregroundColor(.black)
                    .styleDefaultFont(type: .bold, size: 40)
            }.padding(.bottom, 10)
            
            Text(verbatim: "Inc: " + initDate)
                .foregroundColor(.black)
                .styleDefaultFont(type: .light, size: 14)
                .opacity(0.6)
            
            Text(verbatim: "Exp: " + expirationDate)
                .foregroundColor(.black)
                .styleDefaultFont(type: .light, size: 14)
                .opacity(0.6)
        }
    }
}
