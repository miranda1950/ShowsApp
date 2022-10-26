//
//  CastAPIResponse.swift
//  ShowsApp
//
//  Created by COBE on 25.10.2022..
//

import Foundation

struct CastAPIResponse: Codable {
    let person: Person?
    
    struct Person: Codable {
        let id: Int
        let name: String
        let image: Image?
        let character: Character?
        
    }
    
    struct Image: Codable {
        let medium: URL?
        let original: URL?
        
    }
    
    struct Character: Codable {
        let name: String
    }
}
