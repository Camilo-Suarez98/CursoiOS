//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Camilo on 3/9/26.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
        Image(systemName: "square.and.arrow.up")
            .resizable()
            .frame(width: 70, height: 70)
    }
}

#Preview {
    ImageExample()
}
