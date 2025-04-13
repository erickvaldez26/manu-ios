//
//  ImageByName.swift
//  Manu
//
//  Created by Erick Valdez on 23/06/23.
//

import SwiftUI

struct ImageByName: View {
    @State var name: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color("accentGray"))
                
            
            Text(verbatim: $name.wrappedValue)
                .foregroundColor(.white)
                .styleDefaultFont(type: .bold, size: 40)
        }.onAppear {
            getLetterByName()
        }.clipped()
    }
    
    private func getLetterByName() {
        name = String(name[name.startIndex])
        print(name)
    }
}
