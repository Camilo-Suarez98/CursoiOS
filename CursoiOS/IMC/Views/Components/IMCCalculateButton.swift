//
//  IMCCalculateButton.swift
//  CursoiOS
//
//  Created by Camilo on 3/12/26.
//

import SwiftUI

struct IMCCalculateButton: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {
                IMCResultView(userWeight: userWeight, userHeight: userHeight)
            }) {
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

#Preview {
    IMCCalculateButton(userWeight: 60, userHeight: 160)
}
