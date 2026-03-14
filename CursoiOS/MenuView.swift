//
//  MenuView.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

var navigationItems = [
    MenuList(navItem: "IMC Calculator", navRedirect: AnyView(IMCView())),
    MenuList(navItem: "App 2", navRedirect: AnyView(MainView())),
    MenuList(navItem: "App 3", navRedirect: AnyView(IMCView())),
    MenuList(navItem: "App 4", navRedirect: AnyView(IMCView()))
]

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Apps to navigate")) {
                    ForEach(navigationItems) { item in
                        NavigationLink (destination: item.navRedirect) {
                            Text(item.navItem)
                        }
                    }
                }
            }
        }
    }
}

struct MenuList: Identifiable {
    var id = UUID()
    let navItem: String
    let navRedirect: AnyView
}

#Preview {
    MenuView()
}
