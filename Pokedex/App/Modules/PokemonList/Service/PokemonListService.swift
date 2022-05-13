//
//  PokemonListService.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import Foundation

struct PokemonListService{
    
    func getPokemons(onComplete: @escaping ([Pokemon]) -> Void, onError: @escaping () -> Void){
        
        ApiManager.shared.get(url: K.pokemomListURL) { response in
            switch response {
            case .success(let data):
                do{
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let pokemonResponse = try decoder.decode(PokemonResponse.self, from: data)
                        onComplete(pokemonResponse.results)
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
