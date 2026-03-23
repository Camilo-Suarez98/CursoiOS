//
//  FavoritePlaces.swift
//  CursoiOS
//
//  Created by Camilo on 3/20/26.
//

import SwiftUI
import MapKit

struct FavoritePlaces: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 7.0684633, longitude: -73.0995525),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    @State var places: [Place] = []
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position)
                    .onTapGesture {
                        
                    }
            }
        }
    }
}

#Preview {
    FavoritePlaces()
}
