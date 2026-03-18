//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by Camilo on 3/14/26.
//

import Foundation
import UIKit

class ApiNetwork {
    struct WrapperHeroResponse: Decodable {
        let response: String
        let results: [SuperheroResult]
    }
    
    struct SuperheroResult: Decodable, Identifiable {
        let id: String
        let name: String
    }
    
    struct SuperheroDetails: Codable {
        let id: String
        let name: String
        let powerstats: PowerStats
        let biography: Biography
        let appearance: Appearance
    }
    
    struct PowerStats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable {
        let alignment: String
        let publisher: String
        let aliases: [String]
        let fullName: String // Como el nombre en la api viene como full-name se hace el enum de abajo
        
        enum CodingKeys: String, CodingKey {
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
            case fullName = "full-name"
        }
    }
    
    struct Appearance: Codable {
        let gender: String
        let race: String
        let height: [String]
        let weight: [String]
    }
    
    func getHeroesByQuery(query: String) async throws -> WrapperHeroResponse {
        let url = URL(string: "https://superheroapi.com/api/\(Config.superheroApiToken)/search/\(query)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(WrapperHeroResponse.self, from: data)
        
        return wrapper
    }
    
    func getHeroById(id: String) async throws -> SuperheroDetails {
        let url = URL(string: "https://superheroapi.com/api/\(Config.superheroApiToken)/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let superhero = try JSONDecoder().decode(SuperheroDetails.self, from: data)
        
        return superhero
    }
}
