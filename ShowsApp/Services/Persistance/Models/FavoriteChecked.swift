//
//  FavoriteChecked.swift
//  ShowsApp
//
//  Created by COBE on 31.10.2022..
//

import Foundation

struct FavoriteChecked: Codable {
    
    
    let isChecked: Bool
    
    static var defaultData: FavoriteChecked {
        FavoriteChecked(isChecked: true)
    }
    
    func toogleFavorite(_ bool: Bool) -> FavoriteChecked {
        return FavoriteChecked(isChecked: bool)
    }
}
