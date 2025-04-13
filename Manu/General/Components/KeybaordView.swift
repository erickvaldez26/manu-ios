//
//  KeybaordView.swift
//  Manu
//
//  Created by Erick Valdez on 22/06/23.
//

import SwiftUI

struct KeybaordView: View {
    var body: some View {
        Grid {
            GridRow {
                ItemKeyButton(number: "1")
                ItemKeyButton(number: "2")
                ItemKeyButton(number: "3")
            }.padding(.top, 12)
            
            GridRow {
                ItemKeyButton(number: "4")
                ItemKeyButton(number: "5")
                ItemKeyButton(number: "6")
            }
            
            GridRow {
                ItemKeyButton(number: "7")
                ItemKeyButton(number: "8")
                ItemKeyButton(number: "9")
            }
            
            GridRow {
                Divider().foregroundColor(Color.clear)
                ItemKeyButton(number: "0")
                Divider().foregroundColor(Color.clear)
            }.padding(.bottom, 12)
                .padding(.top, 0)
        }.background(.black)
            .cornerRadius(20)
            .padding(.horizontal, 16)
    }
}

struct ItemKeyButton: View {
    var number: String
    
    var body: some View {
        Button {
            print("Keyboard: \(number)")
        } label: {
            Text(verbatim: number)
                .foregroundColor(.white)
                .styleDefaultFont(type: .medium, size: 28)
                .padding(10)
        }
    }
}
