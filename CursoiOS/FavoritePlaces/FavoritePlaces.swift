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
    @State var showPopUp: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var fav: Bool = false
    @State var showSheet: Bool = false
    
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map{ PresentationDetent.fraction($0)}
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    ForEach(places) { place in
                        Annotation(
                            place.name,
                            coordinate: place.coordinates
                        ) {
                            let color = if place.fav {
                                Color.yellow
                            } else {
                                Color.black
                            }
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(
                        coord,
                        from: .local) {
                        showPopUp = coordinates
                    }
                }
                .overlay {
                    VStack {
                        Button("Show list") {
                            showSheet = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(16)
                        Spacer()
                    }
                }
            }
            
            if showPopUp != nil {
                let View = VStack {
                    Text("Añadir ubicación")
                        .font(.title2)
                        .bold()
                    Spacer()
                    TextField("Nombre", text: $name)
                        .padding(.bottom, 8)
                    Toggle("Es un lugar favorito?", isOn: $fav)
                    Spacer()
                    Button("Guardar") {
                        savePlace(
                            name: name,
                            fav: fav,
                            coordinates: showPopUp!
                        )
                        clearForm()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                    Spacer()
                }
                
                withAnimation {
                    CustomDialog(
                        closeDialog: {
                            showPopUp = nil
                        },
                        onDismissOutside: true,
                        content: View
                    )
                }
            }
        }.sheet(isPresented: $showSheet) {
            ScrollView(.horizontal) {
                LazyHStack(content: {
                    ForEach(places) { place in
                        let color = if place.fav {
                            Color.yellow.opacity(0.5)
                        } else {
                            Color.black.opacity(0.5)
                        }
                        
                        VStack {
                            Text(place.name)
                                .font(.title3)
                                .bold()
                        }
                        .frame(width: 200, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(color, lineWidth: 3)
                        }
                        .shadow(radius: 5)
                        .padding(.horizontal, 8)
                        .onTapGesture {
                            animateCamera(coordinates: place.coordinates)
                            showSheet = false
                        }
                    }
                })
            }.presentationDetents(Set(height))
        }.onAppear {
            loadPlaces()
        }
    }
    
    func savePlace(name: String, fav: Bool, coordinates: CLLocationCoordinate2D) {
        let place = Place(
            name: name,
            coordinates: coordinates,
            fav: fav
        )
        places.append(place)
        savePlaces()
    }
    
    func clearForm() {
        name = ""
        fav = false
        showPopUp = nil
    }
    
    func animateCamera(coordinates: CLLocationCoordinate2D) {
        withAnimation {
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                )
            )
        }
    }
}

#Preview {
    FavoritePlaces()
}

extension FavoritePlaces {
    func savePlaces() {
        if let encodeData = try? JSONEncoder().encode(places) {
            UserDefaults.standard.set(encodeData, forKey: "places")
        }
    }
    
    func loadPlaces() {
        if let savedPlaces = UserDefaults.standard.data(forKey: "places"),
           let decodedPlaces = try? JSONDecoder().decode([Place].self, from: savedPlaces) {
            places = decodedPlaces
        }
    }
}
