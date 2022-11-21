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
    @Published var schedule = [ScheduleAPIResponse]()
    @Published var actors = [CastAPIResponse] ()
    @Published var showFavs = Bool()
    @Published var text = String()
    
   
    init(showsAPIService: ShowsAPIServiceProtocol, scheduleAPIService: ScheduleAPIServiceProtocol,castAPIService: CastAPIServiceProtocol, persistanceService: PersistanceServiceProtocol){
        
        self.showsAPIService = showsAPIService
        self.scheduleAPIService = scheduleAPIService
        self.castAPIService = castAPIService
        self.persistanceService = persistanceService
        
        
    }
    
    
    func loadShows() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            
            self.showsAPIService.fetchShow() { result in
                
                DispatchQueue.main.async {              
                    switch (result) {
                    case .success(let response):
                        self.movies.insert(contentsOf: response, at: 0)
                        
                    case .failure(let error):
                        print("error: \( error.localizedDescription)")
                    }
                    
                }
            }
            
        }
    }
    func loadSchedule()  {
        DispatchQueue.global(qos: .background).async { [ weak self ] in
            guard let self = self else { return }
        
            
            self.scheduleAPIService.fetchShowsSchedule() { result in
                DispatchQueue.main.async {
                    
                
                switch (result) {
                case .success(let response):
                    self.schedule.insert(contentsOf: response, at: 0)
                case .failure(let error):
                    print("error: \(error.localizedDescription) ")
                }
                }
        }
        }
    }
    
    func getActors(_ movie: Int)  {
            
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
    
    func emptyActorsField()  {
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


