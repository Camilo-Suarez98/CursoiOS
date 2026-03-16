//
//  SuperheroItem.swift
//  CursoiOS
//
//  Created by Camilo on 3/15/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroItem: View {
    let superhero: ApiNetwork.SuperheroResult
    
    var body: some View {
        VStack {
            Text(superhero.name)
                .foregroundStyle(.white)
                .bold()
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.backgroundComponent)
        }
        .border(.white, width: 1.5)
    }
}
