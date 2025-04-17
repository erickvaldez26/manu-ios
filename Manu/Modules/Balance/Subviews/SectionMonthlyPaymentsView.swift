//
//  SectionMonthlyPaymentsView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct SectionMonthlyPaymentsView: View {
    let listServices: [MonthlyPayment] = [
        MonthlyPayment(id: 0, service: "Win", imageRef: "network", typeTag: "Internet", amount: 99.0, expiration: "28"),
        MonthlyPayment(id: 1, service: "Fallabela Deuda", imageRef: "banknote.fill", typeTag: "Prestamo bancario", amount: 866.28, expiration: "05"),
        MonthlyPayment(id: 2, service: "Movistar", imageRef: "iphone.gen2", typeTag: "Linea movil y iphone 11", amount: 274.60, expiration: "12"),
        MonthlyPayment(id: 3, service: "Brayan", imageRef: "iphone.gen3", typeTag: "iPhone 14", amount: 324.92, expiration: "28"),
        MonthlyPayment(id: 4, service: "UPN", imageRef: "graduationcap.fill", typeTag: "Estudios Alanyss", amount: 300.0, expiration: "15"),
        MonthlyPayment(id: 5, service: "Netflix", imageRef: "popcorn.fill", typeTag: "Entretenimiento", amount: 12.0, expiration: "16")
    ]
    
    @State private var totalAmountServices: Double = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(verbatim: Constants.Localized.monthlyPayment.apply())
                    .foregroundColor(.black)
                    .styleDefaultFont(type: .medium, size: 16)
                    .padding(.bottom, 14)
                
                Spacer()
                
                Text(verbatim: "S/. " + String(format: "%.2f", totalAmountServices))
                    .foregroundColor(.black)
                    .styleDefaultFont(type: .regular, size: 14)
                    .padding(.bottom, 14)
            }.frame(width: UIScreen.main.bounds.width - 32)
            
            VStack {
                ForEach(listServices, id: \.self) { item in
                    Button {
                        print("Select item \(item)")
                    } label: {
                        HStack {
                            VStack {
                                Image(systemName: item.imageRef)
                                    .foregroundColor(.black)
                            }.frame(width: 50, height: 50)
                                .background(Color("primaryColor"))
                                .cornerRadius(14)
                                .padding(.leading, 14)
                                
                            VStack(alignment: .leading, spacing: 8) {
                                Text(verbatim: item.service)
                                    .foregroundColor(.black)
                                    .styleDefaultFont(type: .bold, size: 15)
                                    
                                Text(verbatim: item.typeTag)
                                    .foregroundColor(.black)
                                    .styleDefaultFont(type: .light, size: 12)
                            }
                                
                            Spacer()
                                
                            VStack(alignment: .trailing, spacing: 8) {
                                Text(verbatim: "S/. \(item.amount)")
                                    .foregroundColor(Color("accentRed"))
                                    .styleDefaultFont(type: .bold, size: 15)
                                    
                                Text(verbatim: "\(item.expiration) c/m")
                                    .foregroundColor(.black)
                                    .styleDefaultFont(type: .light, size: 12)
                            }.padding(.trailing, 14)
                        }.frame(width: UIScreen.main.bounds.size.width - 32, height: 80)
                            .background(.white)
                            .cornerRadius(15)
                    }
                }.onAppear {
                    listServices.forEach { item in
                        totalAmountServices += item.amount
                    }
                }
            }.padding(.bottom, 45)
        }.frame(width: UIScreen.main.bounds.size.width)
            .ignoresSafeArea()
    }
}
