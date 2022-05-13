//
//  PokemonDetailService.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import Foundation

struct PokemonDetailService{
    
    func getPokemon(urlPokemon: String, onComplete: @escaping (PokemonDetail) -> Void, onError: @escaping () -> Void){
        
        ApiManager.shared.get(url: urlPokemon) { response in
            switch response {
            case .success(let data):
                do{
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let pokemonDetail = try decoder.decode(PokemonDetail.self, from: data)
                        onComplete(pokemonDetail)
                    }else {
                        onError()
                    }
                }catch{
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
    }
}
