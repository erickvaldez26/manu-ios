//
//  ImageAndPersonNameView.swift
//  Manu
//
//  Created by Erick Valdez on 23/06/23.
//

import SwiftUI

struct ImageAndPersonNameView: View {
    @State var personName: String
    
    var body: some View {
        VStack {
            ImageByName(name: personName)
                .padding(.bottom, 12)
            
            Text(verbatim: personName)
                .styleDefaultFont(type: .medium, size: 20)
                .foregroundColor(.black)
        }
    }
}
