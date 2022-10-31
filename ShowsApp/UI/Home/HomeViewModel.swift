//
//  HomeViewModel.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI

final class HomeViewModel<T>: ObservableObject {
    
    private let showsAPIService: ShowsAPIServiceProtocol
    private let scheduleAPIService: ScheduleAPIServiceProtocol
    private let castAPIService: CastAPIServiceProtocol
    private let persistanceService: PersistanceServiceProtocol
    
    var onGoToDetails: ((_ movie: T, _ cast: [CastAPIResponse]) -> Void)?
    
    @Published var movies = [ShowsAPIResponse] ()
    @Published var schedule = [ScheduleAPIResponse] ()
    @Published var actors = [CastAPIResponse] ()
    @Published var showFavs = Bool()
    
    
   
    init(showsAPIService: ShowsAPIServiceProtocol, scheduleAPIService: ScheduleAPIServiceProtocol,castAPIService: CastAPIServiceProtocol, persistanceService: PersistanceServiceProtocol){
        
        self.showsAPIService = showsAPIService
        self.scheduleAPIService = scheduleAPIService
        self.castAPIService = castAPIService
        self.persistanceService = persistanceService
        
        
    }
    
    
    func loadShows() {
        showsAPIService.fetchShow() { [weak self] result in
                switch (result) {
                case .success(let response):
                    self?.movies.insert(contentsOf: response, at: 0)
                    
                case .failure(let error):
                    print("error: \( error.localizedDescription)")
                }
    
           
        }
        
        
    }
    func loadSchedule() {
        scheduleAPIService.fetchShowsSchedule() { [weak self] result in
                switch (result) {
                case .success(let response):
                    self?.schedule.insert(contentsOf: response, at: 0)
                case .failure(let error):
                    print("error: \(error.localizedDescription) ")
                }
            
        }
    }
    
    func getActors(_ movie: Int) {
        castAPIService.fetchShowsSchedule(for: movie) { [weak self] result in
            switch(result) {
            case .success(let response):
                let cast = response
                self?.actors.insert(contentsOf: cast, at: 0)
                
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
            
        }
    }
    
    func emptyActorsField(){
        for _ in actors.enumerated().reversed() {
            actors.removeAll()
        }
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
                showFavs = false
                favoriteMovies.remove(at: index)
                
                
            }
        }
        else {
            showFavs = true
            favoriteMovies.insert(movieItem, at: 0)
            
            
        }
        persistanceService.movieData = MovieData(movies: favoriteMovies, movieItem: movieItem)
        
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
        persistanceService.movieData = MovieData(movies: favoriteMovies, movieItem: movieItem)
        
    }
    
    func favoriteChecked(_ favoriteIconChecked: Bool){
        
        let newFavoriteData = persistanceService.isFavorite.toogleFavorite(favoriteIconChecked)
       
        persistanceService.isFavorite = newFavoriteData
        
        
        
    }
    
    
    
}


