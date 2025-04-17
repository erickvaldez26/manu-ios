//
// LgoinTopBar.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct LoginTopBar: View {
    var body: some View {
        HStack {
            Image(Constants.IconsName.resourceAppIcon)
                .resizable()
                .frame(width: 24, height: 24)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            Group {
                Text(Constants.Localized.appName.apply())
                    .styleDefaultFont(type: .bold, size: 20) +
                
                Text("\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)")
                    .styleDefaultFont(type: .regular, size: 10)
            }
        }
    }
}
