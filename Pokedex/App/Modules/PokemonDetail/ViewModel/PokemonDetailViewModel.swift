//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import Foundation

protocol PokemonDetailDelegate{
    func showError()
    func didUpdatePokemon(pokemon: PokemonDetail)
}

class PokemonDetailViewModel {
    
    private var service: PokemonDetailService
    private var delegate: PokemonDetailDelegate?
    private var pokemonUrl: String
    
    init(pokemonUrl: String, service: PokemonDetailService , delegate: PokemonDetailDelegate?){
        self.pokemonUrl = pokemonUrl
        self.service = service
        self.delegate = delegate
    }
    
    func getPokemon(){
        service.getPokemon(urlPokemon: pokemonUrl) { [weak self] pokemon in
            self?.delegate?.didUpdatePokemon(pokemon: pokemon)
        } onError: {
            self.delegate?.showError()
        }
    }
}
