//
//  DragConfirmButton.swift
//  Manu
//
//  Created by Erick Valdez on 23/06/23.
//

import SwiftUI

struct DragConfirmButton: View {
    @AppStorage("modalPresent") var modalPresent: String = "none"
    @AppStorage("disableScreen") var disableScreen: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var offset: CGPoint = CGPoint(x: 32, y: 30)
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 18).foregroundColor(Color("accentGray"))
                    .frame(width: 60, height: 53)
                    .padding(.leading, 4)
                
                Image(systemName: "chevron.forward.2")
                    .foregroundColor(.white)
                    .padding(.leading, 4)
            }.position(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if offset.x >= 30 && offset.x <= 318 {
                                offset.x = value.location.x
                            }
                        }
                        .onEnded { _ in
                            print("X: \(offset.x); Y: \(offset.y)")
                            if offset.x > 300 {
                                modalPresent = "success"
                                disableScreen = true
                            } else {
                                offset = CGPoint(x: 30, y: 30)
                                print("Aun no realizas el pago")
                            }
                        }
                ).animation(.easeInOut, value: offset)
            
            Spacer()
        }.frame(width: UIScreen.main.bounds.size.width - 32, height: 60)
            .background(Color("accentLightGray").opacity(0.1))
            .cornerRadius(20)
    }
}

struct DragConfirmButton_Previews: PreviewProvider {
    static var previews: some View {
        DragConfirmButton()
    }
}
