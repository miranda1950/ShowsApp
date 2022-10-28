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
    
    var onGoToDetails: ((_ movie: T, _ cast: [CastAPIResponse]) -> Void)?
    
    @Published var movies = [ShowsAPIResponse] ()
    @Published var schedule = [ScheduleAPIResponse] ()
    @Published var actors = [CastAPIResponse] ()
    
    
    
    init(showsAPIService: ShowsAPIServiceProtocol, scheduleAPIService: ScheduleAPIServiceProtocol,castAPIService: CastAPIServiceProtocol){
        
        self.showsAPIService = showsAPIService
        self.scheduleAPIService = scheduleAPIService
        self.castAPIService = castAPIService
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
    
    func markFavorite() {

    }
    
    
}


