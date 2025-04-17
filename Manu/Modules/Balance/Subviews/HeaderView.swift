//
//  HeaderView.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import SwiftUI
import FirebaseAuth

struct HeaderView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    
    @State var nameUser: String = "Erick"
    @State var profileUrl: URL = URL(string: "https://shanibacreative.com/wp-content/uploads/2020/06/membuat-foto-profil-yang-bagus.jpg")!
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            appCoordinator.resetToRoot()
        } catch let error as NSError {
            print("MANU -> Error al cerrar sesión: %@", error)
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(verbatim: "\(Constants.Localized.helloUser.apply()) \(nameUser)")
                    .styleDefaultFont(type: .bold, size: 22)
                    .foregroundColor(.black)
                
                Text(verbatim: Constants.Localized.welcomeBack.apply())
                    .styleDefaultFont(type: .light, size: 14)
                    .foregroundColor(.black)
            }
            Spacer()
            ZStack {
                Circle().foregroundColor(Color.white).frame(width: 40, height: 40)
                Image(systemName: Constants.IconsName.notification)
                    .foregroundColor(.black)
            }.padding(.trailing, 10)
            Button {
                signOut()
            } label: {
                AsyncImage(url: profileUrl) { content in
                    content.image?
                        .resizable()
                        .cornerRadius(25)
                }.frame(width: 40, height: 40)
            }
        }.padding([.leading, .trailing], 16)
    }
}
