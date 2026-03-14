//
//  IMCResultView.swift
//  CursoiOS
//
//  Created by Camilo on 3/12/26.
//

import SwiftUI

struct IMCResultView: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        VStack {
            Text("Tu resultado")
                .bold()
                .font(.title)
                .foregroundStyle(.white)
            
            let result = calculateImc(weight: userWeight, height: userHeight)
            InformationResultView(result: result)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .foregroundStyle(.white)
    }
}

func calculateImc(weight: Double, height: Double) -> Double {
    let heightInMeters = height / 100
    let result = weight / (heightInMeters * heightInMeters)
    return result
}

#Preview {
    IMCResultView(userWeight: 70, userHeight: 174)
}
