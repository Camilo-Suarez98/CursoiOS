//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by Camilo on 3/9/26.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        TextField("Escribe tu email", text: $email)
            .keyboardType(.emailAddress)
            .font(.system(size: 25))
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal, 20)
            .onChange(of: email) { oldValue, newValue in
                print("Antiguo email era: \(oldValue) y el nuevo es \(newValue)")
            }
        
        SecureField("Escribe tu contraseña", text: $password)
            .keyboardType(.default)
            .font(.system(size: 25))
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal, 20)
            .onChange(of: password) { oldValue, newValue in
                print("Antiguo contraseña era: \(oldValue) y la nueva es \(newValue)")
            }
    }
}

#Preview {
    TextFieldExample()
}
