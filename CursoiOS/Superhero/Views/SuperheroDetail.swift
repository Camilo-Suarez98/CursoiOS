//
//  SuperheroDetail.swift
//  CursoiOS
//
//  Created by Camilo on 3/15/26.
//

import SwiftUI

struct SuperheroDetail: View {
    let id: String
    @State var superhero: ApiNetwork.SuperheroDetails? = nil
    @State var loading: Bool = true
    
    var body: some View {
        VStack {
            if loading {
                ProgressView().tint(.white)
            } else if let superhero = superhero {
                Text(superhero.name)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.bottom, 8)
                Text(superhero.biography.fullName)
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                ForEach(superhero.biography.aliases, id: \.self) { alias in
                    Text(alias.isEmpty ? "No aliases" : alias)
                        .foregroundStyle(.gray)
                        .italic()
                        .font(.title2)
                }
                let alignmentHero = superhero.biography.alignment.capitalized
                if alignmentHero == "Good" {
                    Text(alignmentHero)
                        .foregroundStyle(.green)
                        .font(.title2)
                        .bold()
                } else {
                    Text(alignmentHero)
                        .foregroundStyle(.red)
                        .font(.title2)
                        .bold()
                }
                
                SuperheroStats(stats: superhero.powerstats)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .onAppear {
            Task {
                do {
                    superhero = try await ApiNetwork().getHeroById(id: id)
                } catch {
                    superhero = nil
                }
                loading = false
            }
        }
    }
}

#Preview {
    SuperheroDetail(id: "2")
}
