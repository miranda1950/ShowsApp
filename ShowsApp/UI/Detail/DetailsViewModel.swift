//
//  DetailsViewModel.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI


final class DetailsViewModel<T>: ObservableObject {
    
    var data: T
    let cast: [CastAPIResponse]
    @Published var showFavs = Bool()
    
    private let persistanceService: PersistanceServiceProtocol
    
    
    var onDissmised: (()-> Void)?
    
    init(data: T, cast: [CastAPIResponse], persistanceService: PersistanceServiceProtocol) {
        
        self.data = data
        self.cast = cast
        self.persistanceService = persistanceService
    }
    
    func dismiss() {
        onDissmised?()
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
    
    func markFavoriteShow(_ movie: ShowsAPIResponse) {
        
        let movieItem = persistanceService.movieData.movieItem.createMovieDatafromShow(movie)
        var favoriteMovies = persistanceService.movieData.movies
        
        if contains(movieItem) {
            if let index = favoriteMovies.firstIndex(where: {$0.id == movie.id}) {
              
                favoriteMovies.remove(at: index)
                showFavs = false
                
            }
        }
        else {
            
            favoriteMovies.insert(movieItem, at: 0)
            showFavs = true
            
        }
        persistanceService.movieData = MovieData(movies: favoriteMovies, movieItem: movieItem, favoriteChecked: showFavs)
        
    }
    
    func markFavoriteSchedule(_ movie: ScheduleAPIResponse) {
        
        let movieItem = persistanceService.movieData.movieItem.createMovieDatafromSchedule(movie)
        var favoriteMovies = persistanceService.movieData.movies
        
        if contains(movieItem) {
            if let index = favoriteMovies.firstIndex(where: {$0.id == movie.id}) {
                favoriteMovies.remove(at: index)
                showFavs = false
            }
        }
        else {
            favoriteMovies.insert(movieItem.self, at: 0)
            showFavs = true
        }
        persistanceService.movieData = MovieData(movies: favoriteMovies, movieItem: movieItem, favoriteChecked: showFavs)
        
    }
    
    
    func favoriteChecked(_ favoriteIconChecked: Bool){
        
        let newFavoriteData = persistanceService.movieData.isIconChecked(favoriteIconChecked)
       
        persistanceService.movieData.favoriteChecked = newFavoriteData
        
    }
    
    func isShowFavorite(_ show: ShowsAPIResponse) -> Bool {
        let favorites = persistanceService.movieData.movies
        
        for favorite in favorites {
            if favorite.id == show.id {
                return true
            }
        }
        return false
    }
    
    func isScheduleFavorite(_ schedule: ScheduleAPIResponse) -> Bool {
        let favorites = persistanceService.movieData.movies
        
        for favorite in favorites {
            if favorite.id == schedule.id {
                return true
            }
        }
        return false
    }
}


