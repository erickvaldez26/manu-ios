//
//  EnrollmentTopBar.swift
//  Manu
//
//  Created by Erick Valdez on 28/03/24.
//

import SwiftUI

struct EnrollmentTopBar: View {
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "AppIcon")!)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Group {
                Text(verbatim: "Manu ")
                    .styleDefaultFont(type: .bold, size: 20) +
                
                Text(verbatim: "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)")
                    .styleDefaultFont(type: .regular, size: 10)
            }
        }
    }
}

#Preview {
    EnrollmentTopBar()
}
