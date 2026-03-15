//
//  Config.swift
//  CursoiOS
//
//  Created by Camilo on 3/14/26.
//

import Foundation

enum Config {
    static var superheroApiToken: String {
        guard let token = Bundle.main.object(forInfoDictionaryKey: "SUPERHERO_API_TOKEN") as? String else {
            fatalError("SUPERHERO_API_TOKEN no encontrado")
        }
        return token
    }
}
