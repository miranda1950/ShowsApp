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
    @Published var showFavs = Bool()
   
    
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
            showFavs = false
        }
        }
        else {
            favoriteMovies.insert(movie.self, at: 0)
            showFavs = true
        }
        
        persistanceService.movieData = MovieData(movies: favoriteMovies, movieItem: movie, favoriteChecked: showFavs)
    }
    
    
    
    
    func favoriteChecked(_ favoriteIconChecked: Bool){
        
        let newFavoriteData = persistanceService.movieData.isIconChecked(favoriteIconChecked)
       
        persistanceService.movieData.favoriteChecked = newFavoriteData
        
        
    }
    
}
