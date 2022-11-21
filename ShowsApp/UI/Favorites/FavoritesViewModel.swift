//
//  FavoritesViewModel.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import SwiftUI


final class FavoritesViewModel<T>: ObservableObject {
    
    private let persistanceService: PersistanceServiceProtocol
    private let showsAPIResponse: ShowsAPIResponse
    private let castAPIService: CastAPIServiceProtocol
    
    var onGoToDetails: ((_ movie: ShowsAPIResponse, _ cast: [CastAPIResponse]) -> Void)?
    
    @Published var movies = [SearchAPIResponse] ()
    @Published var actors = [CastAPIResponse] ()
    @Published var favoriteMovies = [MovieData.MovieItem]()
    @Published var showFavs = Bool()
   
    
    init(persistanceService: PersistanceServiceProtocol, showsAPIResponse: ShowsAPIResponse, castAPIService: CastAPIServiceProtocol) {
        self.persistanceService = persistanceService
        self.showsAPIResponse = showsAPIResponse
        self.castAPIService = castAPIService
        
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
    
    func emptyActorsField(){
        for _ in movies.enumerated().reversed() {
            movies.removeAll()
        }
    }
    
    func createShowData(_ movie: MovieData.MovieItem) -> ShowsAPIResponse {
        let show = showsAPIResponse.createShowDataFromFavorites(movie)
        
        return show
    }
    
    func getActors(_ movie: Int) {
            self.castAPIService.fetchShowsSchedule(for: movie) { result in
                    
                
            switch(result) {
            case .success(let response):
                let cast = response
                self.actors.insert(contentsOf: cast, at: 0)
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }
    
    
}
