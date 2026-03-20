//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Camilo on 3/9/26.
//

import SwiftUI

struct ButtonExample: View {
    @State var counter = 0
    @State var booleanTest = false
    var body: some View {
        Button("hola") {
            print("Probando")
        }
        .padding(20)
        .font(.system(size: 25))
        .foregroundStyle(.red)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        Button(action: {
            counter += 1
        }, label: {
            Text("Suscriptores: \(counter)")
                .padding(10)
                .bold()
                .font(.title)
                .foregroundStyle(.white)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        
        Button(action: {
            booleanTest.toggle() // Cambia el valor entre ture y false
        }, label: {
            Label(
                booleanTest ? "Activado" : "Desactivado",
                systemImage: booleanTest ? "checkmark.circle.fill" : "xmark.circle.fill"
            )
            .padding(10)
            .bold()
            .font(.title2)
            .foregroundStyle(.white)
            .background(booleanTest ? .green : .gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    ButtonExample()
}
