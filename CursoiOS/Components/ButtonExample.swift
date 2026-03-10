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
        .cornerRadius(10)
        
        Button(action: {
            counter += 1
        }, label: {
            Text("Suscriptores: \(counter)")
                .padding(10)
                .bold()
                .font(.title)
                .foregroundStyle(.white)
                .background(.red)
                .cornerRadius(10)
        })
        
        Button(action: {
            booleanTest.toggle() // Cambia el valor entre ture y false
        }, label: {
            Text("Boolean test es \(booleanTest ? "true" : "false")")
        })
    }
}

#Preview {
    ButtonExample()
}
