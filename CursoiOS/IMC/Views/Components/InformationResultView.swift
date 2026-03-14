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
        VStack {
            Text("IMC")
                .foregroundStyle(.green)
                .font(.title)
                .bold()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
            Text("Este es un resultado normal")
                .font(.title2)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    InformationResultView(result: 5)
}
