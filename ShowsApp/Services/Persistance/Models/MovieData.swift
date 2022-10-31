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
    
    
    struct MovieItem: Codable {
        let id: Int
        let imageMovie: URL?
        
        
        func createMovieDatafromShow(_ movie: ShowsAPIResponse) -> MovieItem {
            return MovieItem(id: movie.id, imageMovie: movie.image.medium)
        }
        
        func createMovieDatafromSchedule(_ movie: ScheduleAPIResponse) -> MovieItem {
            return MovieItem(id: movie.id, imageMovie: movie.show.image?.medium)
        }
        
    }
    
    static var defaultMovieData: Self {
        MovieData(movies: [], movieItem: MovieItem(id: 0, imageMovie: URL(string: "")))
    }
    
    
   
    
    
    
}

