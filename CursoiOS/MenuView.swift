//
//  MenuView.swift
//  CursoiOS
//
//  Created by Camilo on 3/10/26.
//

import SwiftUI

var navigationItems = [
    MenuList(navItem: "IMC Calculator", navRedirect: AnyView(IMCView())),
    MenuList(navItem: "Superhero Finder", navRedirect: AnyView(SuperheroFinderView())),
    MenuList(navItem: "Favorite Places", navRedirect: AnyView(FavoritePlaces())),
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
