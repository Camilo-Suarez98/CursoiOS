//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Camilo on 3/9/26.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Hola Memo", image: "swiftui") // Se usa el nombre de la imagen en assets
        Label("Con icono", systemImage: "square.and.arrow.up.fill") // Usando SF system para los iconos
        Label(
            title: { Text("Label") },
            icon: { Image( "swiftui")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
        )
    }
}

#Preview {
    LabelExample()
}
