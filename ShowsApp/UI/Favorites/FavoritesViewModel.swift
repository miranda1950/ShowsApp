//
//  FavoritesViewModel.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import SwiftUI


final class FavoritesViewModel: ObservableObject {
    
    private let persistanceService: PersistanceServiceProtocol
    @Published var favoriteMovies = [MovieData.MovieItem]()
   
    
    init(persistanceService: PersistanceServiceProtocol) {
        self.persistanceService = persistanceService
        
    }
    
    func loadFavoriteMovies() {
        
        favoriteMovies = persistanceService.movieData.movies
        
    }
    
    func contains(_ movie: MovieData.MovieItem) -> Bool {
        let favs = persistanceService.movieData.movies
        
        for item in favs {
            if item.id == movie.id {
                return true
            }
        }
        return false
      
    }
    
    
    func removeFavorite(_ movie: MovieData.MovieItem) {
        var favoriteMovies = persistanceService.movieData.movies
        
        if contains(movie) {
        if  let index = favoriteMovies.firstIndex(where: {$0.id == movie.id}) {
            favoriteMovies.remove(at: index)
        }
        }
        else {
            favoriteMovies.insert(movie.self, at: 0)
        }
        
        persistanceService.movieData = MovieData(movies: favoriteMovies, movieItem: movie)
    }
    
    
    
    
}
