//
//  MovieData.swift
//  ShowsApp
//
//  Created by COBE on 29.10.2022..
//

import Foundation


struct MovieData: Codable {
    
    let movies: [MovieItem]
    let movieItem: MovieItem
    var favoriteChecked: Bool
    
    
    struct MovieItem: Codable {
        let id: Int
        let imageMovie: URL?
        let summary: String
        
        func createMovieDatafromShow(_ movie: ShowsAPIResponse) -> MovieItem {
            return MovieItem(id: movie.id, imageMovie: movie.image.medium, summary: movie.summary)
        }
        
        func createMovieDatafromSchedule(_ movie: ScheduleAPIResponse) -> MovieItem {
            return MovieItem(id: movie.id, imageMovie: movie.show.image?.medium, summary: movie.show.summary ?? "")
        }
        
    }

    mutating func isIconChecked(_ bool: Bool) -> Bool {
        favoriteChecked = bool
        return favoriteChecked
    }
    
    static var defaultMovieData: Self {
        MovieData(movies: [], movieItem: MovieItem(id: 0, imageMovie: URL(string: ""), summary: ""), favoriteChecked: true)
    }
    
    
   
    
    
    
}

