//
//  CalculateSpentTopBar.swift
//  Manu
//
//  Created by Erick Valdez on 22/06/23.
//

import SwiftUI

struct CalculateSpentTopBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.white)
                    .padding(.all, 10)
            }
            
            Text(verbatim: "Calcular gasto")
                .foregroundColor(.white)
                .styleDefaultFont(type: .medium, size: 20)
            
            Spacer()
        }.frame(width: UIScreen.main.bounds.size.width - 32).padding(.top, 8)
    }
}

struct CalculateSpentTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CalculateSpentTopBar()
    }
}
