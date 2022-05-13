//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import Foundation

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let sprites: Sprite
}
