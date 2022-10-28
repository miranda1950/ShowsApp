//
//  SearchViewModel.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    
    private let searchAPIService: SearchAPIServiceProtocol
    
    @Published var movies = [SearchAPIResponse] ()
    
    init(searchAPIService: SearchAPIServiceProtocol) {
        self.searchAPIService = searchAPIService
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
    
    
}
