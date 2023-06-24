//
//  CardValidateRiskView.swift
//  Manu
//
//  Created by Erick Valdez on 22/06/23.
//

import SwiftUI

struct CardValidateRiskView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(verbatim: "Este gasto supone un peligro elevado para tu bolsillo")
                    .foregroundColor(.white)
                    .styleDefaultFont(type: .medium, size: 13)
                    .padding(.all, 16)
                
                Spacer()
                
                Image(systemName: "nosign.app.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
                    .padding(.trailing, 16)
            }
            .frame(width: UIScreen.main.bounds.size.width - 32)
            .background(Color("accentLightGray"))
            .cornerRadius(20)
            .padding([.horizontal], 16)
            
            HStack(alignment: .center) {
                Text(verbatim: "Realmente necesitas realizar este gasto?")
                    .foregroundColor(.white)
                    .styleDefaultFont(type: .medium, size: 13)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width - 32)
            .background(Color("accentLightGray"))
            .cornerRadius(20)
            .padding([.horizontal, .bottom], 16)
        }
    }
}

struct CardValidateRiskView_Previews: PreviewProvider {
    static var previews: some View {
        CardValidateRiskView()
    }
}
