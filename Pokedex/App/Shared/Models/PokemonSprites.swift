//
//  PokemonSprites.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import Foundation

struct Sprite: Codable {
    let other: SpriteOther?
}

struct SpriteOther: Codable {
    let home: SpriteHome?
}

struct SpriteHome: Codable {
    let frontDefault: String?
}
