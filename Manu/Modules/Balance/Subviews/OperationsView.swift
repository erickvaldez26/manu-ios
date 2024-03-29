//
//  OperationsView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct OperationsView: View {
    @AppStorage("modalPresent") var modalPresent: String = "none"
    @AppStorage("disableScreen") var disableScreen: Bool = false
    
    var body: some View {
        HStack(spacing: 6) {
            Button {
                print("Recivir")
                modalPresent = "success"
                disableScreen = true
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: Constants.IconsName().receiveIcon)
                        .foregroundColor(.white)
                    Text(verbatim: Constants.HomePage().receive)
                        .styleDefaultFont(type: .regular, size: 13)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }.frame(width: UIScreen.main.bounds.size.width / 2 - 19, height: 80)
                    .background(Color.black)
                    .cornerRadius(20)
            }
            
            Button {
                print("Transferir")
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: Constants.IconsName().transferIcon)
                        .foregroundColor(.white)
                    Text(verbatim: Constants.HomePage().transfer)
                        .styleDefaultFont(type: .regular, size: 13)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }.frame(width: UIScreen.main.bounds.size.width / 2 - 19, height: 80)
                    .background(Color.black)
                    .cornerRadius(20)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width - 32)
        .padding(.horizontal, 16)
    }
}
