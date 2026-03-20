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
                    .padding(.bottom, 8)
                Text(superhero.appearance.gender)
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.bottom, 8)
                let aliases = superhero.biography.aliases
                if aliases == ["-"] {
                    Text("No aliases")
                        .foregroundStyle(.gray)
                        .italic()
                        .font(.title)
                } else {
                    ForEach(aliases, id: \.self) { alias in
                        Text(alias)
                            .foregroundStyle(.gray)
                            .italic()
                            .font(.title)
                    }
                }
                HStack {
                    let alignmentHero = superhero.biography.alignment.capitalized
                    Text(alignmentHero)
                        .foregroundStyle(alignmentHero == "Good" ? .green : .red)
                        .font(.title2)
                        .bold()
                    Text("- \(superhero.biography.publisher)")
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 8)
                .padding(.top, 8)
                
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
