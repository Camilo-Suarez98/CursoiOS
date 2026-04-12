//
//  SuperheroSearcher.swift
//  CursoiOS
//
//  Created by Camilo on 3/14/26.
//

import SwiftUI

struct SuperheroFinderView: View {
    @State var superheroName: String = ""
    @State var wrapper: ApiNetwork.WrapperHeroResponse? = nil
    @State var loading: Bool = false
    
    var body: some View {
        VStack {
            TextField(
                "",
                text: $superheroName,
                prompt:
                    Text("Superman...")
                    .foregroundStyle(.gray)
                    .font(.title2)
            )
            .font(.title2)
            .bold()
            .foregroundStyle(.neutral)
            .padding(16)
            .border(.superheroTitleBlue, width: 1.5)
            .padding()
            .autocorrectionDisabled()
            .onSubmit {
                loading = true
                Task {
                    do {
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                    } catch {
                        print("Error")
                    }
                    loading = false
                }
            }
            
            if loading {
                ProgressView()
                    .tint(.superheroTitleBlue)
            }
            
            NavigationStack {
                List(wrapper?.results ?? []) { superhero in
                    ZStack {
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: {
                            SuperheroDetail(id: superhero.id)
                        }) { EmptyView() }.opacity(0)
                    }
                }.listStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.superheroBackground)
    }
}

#Preview {
    SuperheroFinderView(loading: false)
}
