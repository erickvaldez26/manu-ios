//
//  DetailsHowMuchOweTopBar.swift
//  Manu
//
//  Created by Erick Valdez on 23/06/23.
//

import SwiftUI

struct DetailsHowMuchOweTopBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.black)
                    .padding(.all, 10)
            }
            
            Text(verbatim: "Le debes a:")
                .foregroundColor(.black)
                .styleDefaultFont(type: .medium, size: 20)
            
            Spacer()
        }.frame(width: UIScreen.main.bounds.size.width - 32)
    }
}

struct DetailsHowMuchOweTopBar_Previews: PreviewProvider {
    static var previews: some View {
        DetailsHowMuchOweTopBar()
    }
}
