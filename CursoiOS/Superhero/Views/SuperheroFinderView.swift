//
//  SuperheroSearcher.swift
//  CursoiOS
//
//  Created by Camilo on 3/14/26.
//

import SwiftUI

struct SuperheroFinderView: View {
    @State var superheroname: String = ""
    
    var body: some View {
        let url = "https://superheroapi.com/api/\(Config.superheroApiToken)/search/\(superheroname)"
        VStack {
            TextField(
                "",
                text: $superheroname,
                prompt:
                    Text("Superman...")
                    .foregroundStyle(.gray)
                    .font(.title2)
            )
            .font(.title2)
            .bold()
            .foregroundStyle(.white)
            .padding(16)
            .border(.purple, width: 1.5)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                print(url)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .foregroundStyle(.white)
    }
}

#Preview {
    SuperheroFinderView()
}
