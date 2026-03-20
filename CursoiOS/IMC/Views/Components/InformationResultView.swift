//
//  InformationResultView.swift
//  CursoiOS
//
//  Created by Camilo on 3/12/26.
//

import SwiftUI

struct InformationResultView: View {
    let result: Double
    
    var body: some View {
        let resultInformation = getImcResult(result: result)
        
        VStack(spacing: 50) {
            Text(resultInformation.0)
                .foregroundStyle(resultInformation.2)
                .font(.title)
                .bold()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
            Text(resultInformation.1)
                .font(.title2)
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(16)
    }
}

func getImcResult(result: Double) -> (String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
    switch result {
    case 0.00...19.99:
        title = "Peso Bajo"
        description = "Peso bajo según el IMC"
        color = .yellow
    case 20.00...24.99:
        title = "Peso Normal"
        description = "Estas en el peso recomendado según el IMC"
        color = .green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estas por encima del peso recomendado según el IMC"
        color = .orange
    case 30.00...100,00:
        title = "Obesidad"
        description = "Estas muy por encima del peso recomendado según el IMC"
        color = .red
    default:
        title = "Error"
        description = "Ha ocurrido un error"
        color = .gray
    }
    
    return (title, description, color)
}

#Preview {
    InformationResultView(result: 100)
}
