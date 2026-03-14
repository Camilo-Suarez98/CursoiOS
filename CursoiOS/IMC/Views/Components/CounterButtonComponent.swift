//
//  CounterView.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct CounterButtonComponent: View {
    @Binding var counterNum: Int
    let title: String
    
    var body: some View {
        VStack {
            TitleText(text: title)
            InformationText(text: "\(counterNum)")
            HStack {
                CounterButton(counterNum: $counterNum, actionSymbol: "minus", action: {
                    counterNum -= 1
                })
                .disabled(counterNum <= 0)
                .opacity(counterNum <= 0 ? 0.5 : 1)
                
                CounterButton(counterNum: $counterNum, actionSymbol: "plus", action: {
                    counterNum += 1
                })
                .disabled(counterNum >= 150)
                .opacity(counterNum >= 150 ? 0.5 : 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .foregroundStyle(.white)
    }
}
