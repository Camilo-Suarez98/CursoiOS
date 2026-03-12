//
//  InformationView.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.largeTitle)
    }
}

#Preview {
    InformationText(text: "text")
}
