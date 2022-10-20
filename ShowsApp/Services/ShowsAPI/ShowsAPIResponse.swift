//
//  ShowsAPIResponse.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import Foundation
import SwiftUI


struct ShowsAPIResponse: Identifiable, Codable{
    
    let id: Int
    let name: String
    let summary: String
    let image: Photo
    let rating: Rating
    
    
    struct Photo: Codable {
        let medium: URL?
        let original: URL?
        
        var stringImage: String {
            medium?.absoluteString ?? "There is no url"
        }
    }
    
    struct Rating: Codable {
        let average: Double?
    }
    
    
    
    
}
