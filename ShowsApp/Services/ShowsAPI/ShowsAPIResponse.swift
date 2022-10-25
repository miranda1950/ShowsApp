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
    
    var niceSummary: String {
        
        summary.replacingOccurrences(of: "<p><b>", with: "")
    }
    
    
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
    
    init(id: Int, name: String, summary: String, image: Photo, rating: Rating) {
        self.id = id
        self.name = name
        self.summary = summary
        self.image = image
        self.rating = rating
    }
    
    
    
    
}
