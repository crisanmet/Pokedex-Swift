//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import UIKit

class PokemonListViewController: UIViewController {

    private var service = PokemonListService()
    private var viewModel: PokemonListViewModel?
    private var pokemon = [Pokemon]()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        //table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()

        self.viewModel = PokemonListViewModel(service: service, delegate: self)
        self.viewModel?.getPokemons()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        title = "Pokemon List"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: String(describing: PokemonTableViewCell.self))
        
    }

    private func setupConstraints(){
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
    }
}

//MARK: - Delegate

extension PokemonListViewController: PokemonListDelegate{
    func didUpdatePokemon(pokemon: [Pokemon]) {
        self.pokemon = pokemon
        //print(pokemon)
        
    }
    
    func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError() {
        showMessage(withTitle: "Error", message: "No se cargo nada")
    }
    
    
}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonTableViewCell.self), for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        
        let pokemon = pokemon[indexPath.row]
        cell.name = pokemon.name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = PokemonDetailViewController()
        let pokemon = pokemon[indexPath.row]
        detailViewController.pokemonUrl = pokemon.url
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
