//
//  ToogleButton.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct ToggleButton: View {
    let text: String
    let iconName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        let color = if (gender == selectedGender) {
            Color.backgroundSelected
        } else {
            Color.backgroundComponent
        }
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                InformationView(text: text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
            .foregroundStyle(.white)
        }
    }
}
