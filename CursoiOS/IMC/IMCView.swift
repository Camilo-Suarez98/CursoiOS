//
//  IMCView.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct IMCView: View {
//    init() {
//        UINavigationBar.appearance()
//            .titleTextAttributes = [.foregroundColor: UIColor.white]
//    } Forma de cambiar el navigation title ya que no se puede con estilos
    
    @State var gender: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                ToggleButton(text: "Hombre", iconName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", iconName: "star.fill", gender: 1, selectedGender: $gender)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        // .navigationTitle("IMC Calculator") Esta forma se aplica con el init de arriba
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator").foregroundStyle(.white)
            }
        } // Otra forma de cambiar el texto del navigationtitle que me permite agregar mas estilos
    }
}

#Preview {
    IMCView()
}
