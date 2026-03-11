//
//  MenuView.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }

                Text("App 2")
                Text("App 3")
            }
        }
    }
}

#Preview {
    MenuView()
}
