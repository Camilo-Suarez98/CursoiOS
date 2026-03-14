//
//  TitleText.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .foregroundStyle(.gray)
    }
}

#Preview {
    TitleText(text: "Hola")
}
