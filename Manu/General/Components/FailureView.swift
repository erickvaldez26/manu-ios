//
//  FailureView.swift
//  Manu
//
//  Created by Erick Valdez on 24/06/23.
//

import SwiftUI

struct FailureView: View {
    @AppStorage("modalPresent") var modalPresent: String = "failure"
    @AppStorage("disableScreen") var disableScreen: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @State var isDarK: Bool = true
    @State var goBack: Bool = false
    @State var title: String = ""
    @State var description: String = ""
    @State var textButton: String = ""
    
    var body: some View {
        Color(.black)
            .ignoresSafeArea()
            .opacity(0.6)
            .overlay {
                ZStack {
                    Image(isDarK ? "ticket_failure_dark" : "ticket_failure_light")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width - 48, height: 290)
                    
                    VStack {
                        Text(verbatim: title.isEmpty ? "Error" : title)
                            .styleDefaultFont(type: .medium, size: 18)
                            .foregroundColor(isDarK ? .white : .black)
                            .padding(.bottom, 10)
                            .padding(.top, 32)
                        
                        Divider()
                            .background(isDarK ? Color.white : Color.black)
                            .padding(.horizontal, 58)
                            .padding(.bottom, 24)
                        
                        Text(verbatim: description.isEmpty ? "Algo fallo con los servicios. :c" : description)
                            .styleDefaultFont(type: .regular, size: 12)
                            .frame(width: UIScreen.main.bounds.size.width - 93, alignment: .center)
                            .multilineTextAlignment(.center)
                            .foregroundColor(isDarK ? .white : .black)
                        
                        Button {
                            modalPresent = "none"
                            disableScreen = false
                            
                            if goBack {
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundColor(Color("accentGray"))
                                    .frame(width: UIScreen.main.bounds.size.width - 93, height: 45)
                                
                                Text(verbatim: textButton.isEmpty ? "Continuar" : textButton)
                                    .styleDefaultFont(type: .regular, size: 13)
                                    .foregroundColor(.white)
                            }
                        }.padding(.top, 18)
                    }
                }
            }
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView()
    }
}
