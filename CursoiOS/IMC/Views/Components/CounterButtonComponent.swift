//
//  CounterView.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct CounterView: View {
    @Binding var counterNum: Int
    let title: String
    var body: some View {
        VStack {
            TitleText(text: title)
            InformationText(text: "\(counterNum)")
            HStack {
                Button(action: {
                    counterNum -= 1
                }) {
                    Text("-")
                        .bold()
                        .font(.largeTitle)
                }
                .padding(25)
                .background(.purple)
                .clipShape(Circle())
                Button(action: {
                    counterNum += 1
                }) {
                    Text("+")
                        .bold()
                        .font(.largeTitle)
                }
                .padding(25)
                .background(.purple)
                .clipShape(Circle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .foregroundStyle(.white)
    }
}
