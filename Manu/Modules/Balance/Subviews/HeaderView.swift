//
//  HeaderView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI

struct HeaderView: View {
    @State var nameUser: String = "Erick"
    @State var profileUrl: URL = URL(string: "https://shanibacreative.com/wp-content/uploads/2020/06/membuat-foto-profil-yang-bagus.jpg")!
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(verbatim: "\(Constants.HomePage().helloUser) \(nameUser)")
                    .styleDefaultFont(type: .bold, size: 22)
                    .foregroundColor(.black)
                
                Text(verbatim: Constants.HomePage().welcomeBack)
                    .styleDefaultFont(type: .light, size: 14)
                    .foregroundColor(.black)
            }
            Spacer()
            ZStack {
                Circle().foregroundColor(Color.white).frame(width: 40, height: 40)
                Image(systemName: Constants.IconsName().notification)
                    .foregroundColor(.black)
            }.padding(.trailing, 10)
            AsyncImage(url: profileUrl) { content in
                content.image?
                    .resizable()
                    .cornerRadius(25)
            }.frame(width: 40, height: 40)
        }.padding([.leading, .trailing], 16)
    }
}
