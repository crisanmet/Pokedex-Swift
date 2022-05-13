//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    

    //MARK: - Properties
    
    var name: String? {
        didSet {
            pokemonName.text = name
        }
    }
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var placeholderImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 30
        iv.backgroundColor = .lightGray
        iv.image = UIImage(named: "pokeball")
        return iv
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(placeholderImage)
        contentView.addSubview(pokemonName)
    }
    
    private func setupConstraints(){
        placeholderImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        placeholderImage.setDimensions(height: 20, width: 20)
        pokemonName.centerY(inView: placeholderImage, leftAnchor: placeholderImage.rightAnchor, paddingLeft: 8)
    }
}
