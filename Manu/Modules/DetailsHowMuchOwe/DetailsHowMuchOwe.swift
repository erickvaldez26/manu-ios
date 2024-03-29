//
//  DetailsHowMuchOwe.swift
//  Manu
//
//  Created by Erick Valdez on 22/06/23.
//

import SwiftUI

struct DetailsHowMuchOwe: View {
    @AppStorage("modalPresent") var modalPresent: String = "none"
    @AppStorage("disableScreen") var disableScreen: Bool = false
    @State var arrugaDetail: SmallLoan
    
    var body: some View {
        Color(uiColor: UIColor(named: "primaryColor")!)
            .ignoresSafeArea()
            .overlay {
                ZStack {
                    VStack {
                        DetailsHowMuchOweTopBar()
                            .padding(.top, 8)
                        
                        ImageAndPersonNameView(personName: arrugaDetail.personName)
                            .padding(.top, 50)
                        
                        Spacer()
                        
                        AmountInformationView(
                            amount: arrugaDetail.loans[0].amount,
                            initDate: arrugaDetail.loans[0].initDate,
                            expirationDate: arrugaDetail.loans[0].expirationDate
                        ).padding(.bottom, 50)
                        
                        Spacer()
                        
                        PaymentMethodsView(
                            phoneNumber: arrugaDetail.phoneNumber,
                            interbankAccountNumber: arrugaDetail.interbankAccountNumber
                        ).padding(.bottom, 20)
                        
                        DragConfirmButton()
                            .padding(.bottom, 10)
                    }.disabled(disableScreen)
                        .onAppear {
                            disableScreen = false
                        }
                    
                    if modalPresent == "failure" {
                        FailureView(
                            isDarK: false,
                            goBack: true,
                            title: "Pago fallido",
                            description: "Algo salio mal con el pago, intentalo de nuevo mas tarde."
                        )
                    } else if modalPresent == "success" {
                        SuccessView(
                            isDarK: false,
                            goBack: true,
                            title: "Pago exitoso",
                            description: "Se realizo el pago de tu deuda correctamente. Felicidades!"
                        )
                    }
                }
            }.navigationBarBackButtonHidden(true)
    }
}

struct DetailsHowMuchOwe_Previews: PreviewProvider {
    static var previews: some View {
        DetailsHowMuchOwe(arrugaDetail: SmallLoan(id: 0, personName: "Giam", hasYape: true, hasPlin: false, phoneNumber: "987654321", interbankAccountNumber: "11233143543-342-324-22", loans: [Loan(id: 0, amount: 12.0, initDate: "17/06/2023", expirationDate: "28/06/2023")]))
    }
}
