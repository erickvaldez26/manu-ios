//
//  CardCalculateAndInfoView.swift
//  Manu
//
//  Created by Erick Valdez on 22/06/23.
//

import SwiftUI

struct CardCalculateAndInfoView: View {
    @State var monto: String = ""
    @State var sizeFrameAmount: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 6) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(verbatim: "Monto:")
                        .foregroundColor(.black)
                        .styleDefaultFont(type: .medium, size: 14)
                        .padding(.horizontal, 20)
                        .padding(.top, 18)
                    
                    HStack {
                        Text(verbatim: "120.00")
                            .foregroundColor(.black)
                            .styleDefaultFont(type: .bold, size: 32)
                        
                        Spacer()
                        
                        Text(verbatim: "SOLES")
                            .foregroundColor(.black)
                            .styleDefaultFont(type: .medium, size: 15)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 18)
                }
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.size.width - 32)
                .background(Color(uiColor: UIColor(named: "accentYellow")!))
                .cornerRadius(20)
                .padding([.leading, .trailing], 16)
                .saveSize(in: $sizeFrameAmount)
                
                VStack(alignment: .leading) {
                    Text(verbatim: "Te queda:")
                        .foregroundColor(.white)
                        .styleDefaultFont(type: .medium, size: 14)
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                    
                    HStack {
                        Text(verbatim: "S/. 2,880.00")
                            .foregroundColor(.white)
                            .styleDefaultFont(type: .bold, size: 20)
                        
                        Spacer()
                        
                        Text(verbatim: "S/. 3,000.00")
                            .foregroundColor(.white)
                            .styleDefaultFont(type: .medium, size: 14)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
                    .padding(.top, 4)
                }
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.size.width - 32)
                .background(.black)
                .cornerRadius(20)
                .padding([.leading, .trailing], 16)
            }
            
            ZStack {
                Circle().foregroundColor(Color("accentGray"))
                    .frame(width: 40, height: 40)
                    
                Image(systemName: "arrow.down.to.line.compact")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(.white)
            }.position(x: UIScreen.main.bounds.size.width / 2, y: sizeFrameAmount.height + 3)
        }
    }
}
