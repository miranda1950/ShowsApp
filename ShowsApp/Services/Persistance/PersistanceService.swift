//
//  PersistanceService.swift
//  ShowsApp
//
//  Created by COBE on 29.10.2022..
//

import Foundation

final class PersistanceService: PersistanceServiceProtocol {
    var movieData: MovieData {
        get {
            UserDefaults.standard.load() ?? MovieData.defaultMovieData
        }
        set {
            UserDefaults.standard.save(newValue)
        }
    }
    
    var isFavorite: FavoriteChecked {
        get {
            
            UserDefaults.standard.load() ?? FavoriteChecked.defaultData
        }
        
        set {
            UserDefaults.standard.save(newValue)
        }
    }
}
