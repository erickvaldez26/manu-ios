//
//  RegisterTopBarView.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct RegisterTopBar: View {
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                appCoordinator.pop()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.black)
                    .padding(.all, 10)
            }
            
            Text(verbatim: Constants.StringKeys.register.localized())
                .foregroundColor(.black)
                .styleDefaultFont(type: .medium, size: 20)
            
            Spacer()
        }.frame(width: UIScreen.main.bounds.size.width - 32).padding(.top, 8)
    }
}
