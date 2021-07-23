//
//  ListModel.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import Foundation

struct ListModel : Codable{
    let next: String
    let results: [PokeResults]
}

struct PokeResults: Codable,Hashable{
    let name: String
    let url: String
}
