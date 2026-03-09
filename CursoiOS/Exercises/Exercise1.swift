//
//  ContentView.swift
//  CursoiOS
//
//  Created by Camilo on 3/8/26.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack(content: {
            HStack(content: {
                Rectangle()
                    .foregroundStyle(.blue)
                Rectangle()
                    .foregroundStyle(.orange)
                Rectangle()
                    .foregroundStyle(.yellow)
            }).frame(height: 100)
            HStack(content: {
                Rectangle()
                    .foregroundStyle(.orange)
                    .frame(height: 100)
            })
            HStack(content: {
                Circle()
                    .foregroundStyle(.green)
                Rectangle()
                Circle()
                    .foregroundStyle(.indigo)
            }).frame(height: 250)
            HStack(content: {
                Rectangle()
                    .foregroundStyle(.orange)
                    .frame(height: 100)
            })
            HStack(content: {
                Rectangle()
                    .foregroundStyle(.blue)
                Rectangle()
                    .foregroundStyle(.orange)
                Rectangle()
                    .foregroundStyle(.yellow)
            }).frame(height: 100)
        }).background(.red)
    }
}

#Preview {
    Exercise1()
}
