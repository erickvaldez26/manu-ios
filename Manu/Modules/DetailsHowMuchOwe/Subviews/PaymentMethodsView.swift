//
//  PaymentMethodsView.swift
//  Manu
//
//  Created by Erick Valdez on 23/06/23.
//

import SwiftUI

struct PaymentMethodsView: View {
    @State var phoneNumber: String
    @State var interbankAccountNumber: String
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image("icon_yape")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 12)
                        .padding(.vertical, 10)
                    
                    Text(verbatim: phoneNumber)
                        .foregroundColor(.black)
                        .styleDefaultFont(type: .regular, size: 16)
                        .padding(.trailing, 14)
                }.background(Color("accentPurple").opacity(0.2))
                    .cornerRadius(30)
                
                HStack {
                    Image("icon_plin")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 12)
                        .padding(.vertical, 10)
                    
                    Text(verbatim: phoneNumber)
                        .foregroundColor(.black)
                        .styleDefaultFont(type: .regular, size: 16)
                        .padding(.trailing, 14)
                }.background(Color("accentBlue").opacity(0.4))
                    .cornerRadius(30)
            }
            
            HStack {
                Image(systemName: "building.columns.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 12)
                    .padding(.vertical, 10)
                
                Text(verbatim: interbankAccountNumber)
                    .foregroundColor(.black)
                    .styleDefaultFont(type: .regular, size: 16)
                    .padding(.trailing, 14)
            }.background(Color("accentGreen").opacity(0.4))
                .cornerRadius(30)
        }
    }
}
