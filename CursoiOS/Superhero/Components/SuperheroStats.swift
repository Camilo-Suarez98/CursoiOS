//
//  SuperheroStats.swift
//  CursoiOS
//
//  Created by Camilo on 3/15/26.
//

import SwiftUI
import Charts

struct SuperheroStats: View {
    let stats: ApiNetwork.PowerStats
    
    var body: some View {
        VStack {
            Chart {
                SectorMark(
                    angle: .value("Count", Int(stats.combat) ?? 0),
                    innerRadius: .ratio(0.7),
                    angularInset: 5
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(by: .value("Category", "Combat"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.durability) ?? 0),
                    innerRadius: .ratio(0.7),
                    angularInset: 5
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(by: .value("Category", "Durability"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.intelligence) ?? 0),
                    innerRadius: .ratio(0.7),
                    angularInset: 5
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(by: .value("Category", "Intelligence"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.power) ?? 0),
                    innerRadius: .ratio(0.7),
                    angularInset: 5
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(by: .value("Category", "Power"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.speed) ?? 0),
                    innerRadius: .ratio(0.7),
                    angularInset: 5
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(by: .value("Category", "Speed"))
                
                SectorMark(
                    angle: .value("Count", Int(stats.strength) ?? 0),
                    innerRadius: .ratio(0.7),
                    angularInset: 5
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(by: .value("Category", "Strength"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(24)
    }
}
