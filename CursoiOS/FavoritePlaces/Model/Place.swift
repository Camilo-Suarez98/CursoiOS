//
//  Place.swift
//  CursoiOS
//
//  Created by Camilo on 3/20/26.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var fav: Bool
}
