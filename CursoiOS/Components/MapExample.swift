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
                latitude: 7.0674039,
                longitude: -73.1032497
            ), span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    )
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    Marker("Marker", coordinate: CLLocationCoordinate2D(
                        latitude: 7.0674039,
                        longitude: -73.1032497
                    ))
                }
                    .mapStyle(
                        .hybrid(
                            elevation: .flat,
                            showsTraffic: true
                        )
                    )
                    .onTapGesture { coor in
                        if let coordinates = proxy.convert(coor, from: .local) {
                            withAnimation {
                                position = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(
                                            latitude: coordinates.latitude,
                                            longitude: coordinates.longitude
                                        ), span: MKCoordinateSpan(
                                            latitudeDelta: 0.01,
                                            longitudeDelta: 0.01
                                        )
                                    )
                                )
                            }
                        }
                    }
//                    .onMapCameraChange(frequency: .continuous) { context in
//                        print("Estamos en: \(context.region))
//                              } Para tener latitud y longitud de todas las regiones por donde mueva el mapa
            }
            
            VStack {
                Spacer()
                HStack {
                    Button("Punto 1") {
                        withAnimation {
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
                    }
                    .padding(16)
                    .background(.white)
                    .padding()
                    
                    
                    Button("Punto 2") {
                        withAnimation {
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
