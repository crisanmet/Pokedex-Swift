//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import Foundation

protocol PokemonListDelegate{
    func reloadTable()
    func showError()
    func didUpdatePokemon(pokemon: [Pokemon])
}

class PokemonListViewModel {
    
    private var service: PokemonListService
    //private var pokemons = [Pokemon]()
    private var delegate: PokemonListDelegate?
    
    init(service: PokemonListService , delegate: PokemonListDelegate?){
        self.service = service
        self.delegate = delegate
    }
    
    func getPokemons(){
        service.getPokemons { [weak self] pokemons in
            self?.delegate?.didUpdatePokemon(pokemon: pokemons)
           // self?.pokemons = pokemons
           // print(pokemons)
            self?.delegate?.reloadTable()
        } onError: {
            self.delegate?.showError()
        }

    }
}
