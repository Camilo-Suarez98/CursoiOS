//
//  MapExample.swift
//  CursoiOS
//
//  Created by Camilo on 3/19/26.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 7.1091338,
                longitude: -73.1237504
            ), span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    )
    
    var body: some View {
        ZStack {
            Map(position: $position)
                .mapStyle(
                    .hybrid(
                        elevation: .flat,
                        showsTraffic: true
                    )
            )
            
            VStack {
                Spacer()
                HStack {
                    Button("Punto 1") {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: 7.0674039,
                                    longitude: -73.1032497
                                ), span: MKCoordinateSpan(
                                    latitudeDelta: 0.01,
                                    longitudeDelta: 0.01
                                )
                            )
                        )
                    }
                    .padding(16)
                    .background(.white)
                    .padding()
                    
                    
                    Button("Punto 2") {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: 7.0628089,
                                    longitude: -73.0846552
                                ), span: MKCoordinateSpan(
                                    latitudeDelta: 0.01,
                                    longitudeDelta: 0.01
                                )
                            )
                        )
                    }
                    .padding(16)
                    .background(.white)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
