//
//  ApiManager.swift
//  Pokedex
//
//  Created by Cristian Sancricca on 13/05/2022.
//

import Foundation
import Alamofire

struct ApiManager {
    
    static var shared: ApiManager = {
        return ApiManager()
    }()
    
    private init(){}
    
    public func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void){
        AF.request(url).response { response in
            completion(response.result)
        }
    }
}
