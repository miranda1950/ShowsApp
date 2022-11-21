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
    let premiered: String?
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
    
    func createShowDataFromSearch(_ movie: SearchAPIResponse) -> ShowsAPIResponse {
        return ShowsAPIResponse(id: movie.show?.id ?? 0, name: movie.show?.name ?? "n/A", premiered: "", summary: movie.show?.summary ?? "n/a", image: Photo(medium: movie.show?.image?.medium, original: movie.show?.image?.original), rating: Rating(average: 0.0))
    }
    
    func createShowDataFromFavorites(_ movie: MovieData.MovieItem) -> ShowsAPIResponse {
        return ShowsAPIResponse(id: movie.id, name: "", premiered: "", summary: movie.summary, image: Photo(medium: movie.imageMovie, original: movie.imageMovie), rating: Rating(average: 0.0))
    }
    
    init(id: Int, name: String, premiered: String, summary: String, image: Photo, rating: Rating) {
        self.id = id
        self.name = name
        self.premiered = premiered
        self.summary = summary
        self.image = image
        self.rating = rating
    }
    
    static var defaultShowData: Self {
        ShowsAPIResponse(id: 0, name: "", premiered: "", summary: "", image: Photo(medium: URL(string: ""), original: URL(string: "")), rating: Rating(average: 0.0))
    }
    
    
}
