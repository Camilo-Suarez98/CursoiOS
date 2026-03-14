//
//  CounterButton.swift
//  CursoiOS
//
//  Created by Camilo on 3/11/26.
//

import SwiftUI

struct CounterButton: View {
    @Binding var counterNum: Int
    let actionSymbol: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundStyle(.purple)
                Image(systemName: actionSymbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
    }
}
