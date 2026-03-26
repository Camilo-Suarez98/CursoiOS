//
//  CustomDialog.swift
//  CursoiOS
//
//  Created by Camilo on 3/22/26.
//

import SwiftUI

struct CustomDialog<Content: View>: View {
    let closeDialog: () -> Void
    let onDismissOutside: Bool
    let content: Content
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                Rectangle().fill(.gray.opacity(0.7))
                    .ignoresSafeArea()
                    .onTapGesture {
                        if onDismissOutside {
                            withAnimation {
                                closeDialog()
                            }
                        }
                    }
                
                content
                    .frame(
                        width: geometry.size.width - 100,
                        height: 300
                    )
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(alignment: .topTrailing) {
                        Button(action: {
                            withAnimation {
                                closeDialog()
                            }
                        }, label: {
                            Image(systemName: "xmark.circle")
                        })
                        .foregroundStyle(.gray)
                        .padding(16)
                    }
                
            }
            .ignoresSafeArea()
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
        .ignoresSafeArea()
    }
}
