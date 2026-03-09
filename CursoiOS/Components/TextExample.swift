//
//  TextExample.swift
//  CursoiOS
//
//  Created by Camilo on 3/9/26.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack(content: {
            Text("Placeholder").font(.title)
            Text("Probando custom fuente")
                .font(
                    .system(
                        size: 40,
                        weight: .light,
                        design: .monospaced
                    )
                )
                .italic()
                .underline()
                .foregroundStyle(.yellow)
        })
        Text("Memo Memo Memo Memo Memo")
            .frame(width: 50)
            .lineLimit(4) // Maximo numero de lineas del parrafo
            .lineSpacing(20) // Espaciado de texto
    }
}

#Preview {
    TextExample()
}
