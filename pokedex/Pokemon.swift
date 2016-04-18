//
//  Pokemon.swift
//  pokedex
//
//  Created by Patrick Moening on 4/11/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    var name: String {
         if _name == nil {
            _name = ""
        }
        return _name}
    
    private var _pokedexId: Int!
    var pokedexId: Int {
         if _pokedexId == nil{
            _pokedexId == 1
        }
        return _pokedexId}
    
    private var _description: String!
    var description: String {
        if _description == nil{
           _description = ""
        }
        return _description}
    
    private var _type: String!
    var type: String {
        if _type == nil{
            _type = ""
        }
        return _type}
    
    private var _height: String!
    var height: String {
        if _height == nil{
            _height = ""
        }
        return _height}
    
    private var _weight: String!
    var weight: String {
        if _weight == nil{
            _height = ""
        }
        return _weight}
    
    private var _attack: String!
    var attack: String {
        if _attack == nil{
            _attack = ""
        }
        return _attack}
    
    private var _defense: String!
    var defense: String {
        if _defense == nil{
            _defense = ""
        }
        return _defense}
    
    private var _nextEvoTxt: String!
    var nextEvoTxt: String {
        if _nextEvoTxt == nil{
            _nextEvoTxt = ""
        }
        return _nextEvoTxt}
    
    private var _nextEvoId: String!
    var nextEvoId: String {
        if _nextEvoId == nil {
            _nextEvoId = ""
        }
        return _nextEvoId}
    
    private var _nextEvoLvl: String!
    var nextEvoLvl: String {
        if _nextEvoLvl == nil {
            _nextEvoLvl = ""
        }
        return _nextEvoLvl}
    
    private var _pokemonURL: String!
    var pokemonURL: String{return _pokemonURL}
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete){
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET,url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let height = dict["height"] as? String{
                    self._height = height
                }
                
                if let weight = dict["weight"] as? String{
                    self._weight  = weight
                }
                
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0{
                    if let name = types[0]["name"]{
                        self._type = name.capitalizedString
                        if types.count > 1{
                            for x in 1...types.count - 1 {
                                if let name = types[x]["name"]{
                                    self._type! += "/\(name.capitalizedString)"
                                }
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                print(self._name)
                print(self._type)
                
                if let descriptionArray = dict["descriptions"] as? [Dictionary<String,String>] where descriptionArray.count > 0{
                    
                    if let url = descriptionArray[0]["resource_uri"]{
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        
                        Alamofire.request(.GET, nsurl).responseJSON { response in
                            let desResult = response.result
                            if let descDict = desResult.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                    print(self._description)
                                }
                            }
                            completed() 
                        }
                        
                    } else {
                        self._description = ""
 
                    }
                    if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolutions.count > 0 {
                        if let to = evolutions[0]["to"] as? String{
                            
                            //API doesn't support mega
                            if to.rangeOfString("mega") == nil {
                                if let uri = evolutions[0]["resource_uri"] as? String{
                                    let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                    let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                    
                                    self._nextEvoId = num
                                    self._nextEvoTxt = to
                                    
                                    if let level = evolutions[0]["level"] as? Int {
                                        self._nextEvoLvl = "\(level)"
                                    }
                                    print(self._nextEvoTxt)
                                    print(self._nextEvoId)
                                    print(self._nextEvoLvl)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}




