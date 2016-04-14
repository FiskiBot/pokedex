//
//  Pokemon.swift
//  pokedex
//
//  Created by Patrick Moening on 4/11/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    var name: String {return _name}
    
    private var _pokedexId: Int!
    var pokedexId: Int {return _pokedexId}
    
    private var _type: String!
    var type: String {return _type}
    
    private var _height: String!
    var height: String {return _height}
    
    private var _weight: String!
    var weight: String {return _weight}
    
    private var _attack: String!
    var attack: String {return _attack}
    
    private var _defense: String!
    var defense: String {return _defense}
    
    private var _nextEvo: String!
    var nextEvo: String {return _nextEvo}
    
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
    
    
}