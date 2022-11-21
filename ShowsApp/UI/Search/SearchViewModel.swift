//
//  SearchViewModel.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import SwiftUI

final class SearchViewModel<T>: ObservableObject {
    
    private let searchAPIService: SearchAPIServiceProtocol
    private let showsAPIResponse: ShowsAPIResponse
    private let castAPIService: CastAPIServiceProtocol
    var onGoToDetails: ((_ movie: ShowsAPIResponse, _ cast: [CastAPIResponse]) -> Void)?
    
    @Published var movies = [SearchAPIResponse] ()
    @Published var actors = [CastAPIResponse] ()
    
    init(searchAPIService: SearchAPIServiceProtocol, showsAPIResponse: ShowsAPIResponse, castAPIService: CastAPIServiceProtocol) {
        self.searchAPIService = searchAPIService
        self.showsAPIResponse = showsAPIResponse
        self.castAPIService = castAPIService
    }
    
    func loadShows(for text: String) {
        searchAPIService.fetchJSON(for: text) { [weak self] result in
           
                switch (result) {
                case .success(let response):
                    self?.movies.insert(contentsOf: response, at: 0)
                    
                case .failure(let error):
                    print("error: \( error.localizedDescription)")
                }
            
            
        }
        
    }
    
    func emptyActorsField(){
        for _ in movies.enumerated().reversed() {
            movies.removeAll()
        }
    }
    
    func createShowData(_ movie: SearchAPIResponse) -> ShowsAPIResponse {
        let show = showsAPIResponse.createShowDataFromSearch(movie)
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
