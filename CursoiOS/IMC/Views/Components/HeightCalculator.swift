//
//  HeightCalculator.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .padding(.horizontal, 16)
                .tint(.purple)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}
