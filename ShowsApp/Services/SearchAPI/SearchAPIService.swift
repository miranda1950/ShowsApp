//
//  SearchAPIService.swift
//  ShowsApp
//
//  Created by COBE on 27.10.2022..
//

import Foundation

final class searchAPIService: SearchAPIServiceProtocol {
    
    private let dataService: DataServiceProtocol = DataService()
    
    init() { }
    
    func fetchJSON(for text: String, completionHandler: @escaping (Result<[SearchAPIResponse], Error>) -> Void) {
        
        guard let url = URL(string: "https://api.tvmaze.com/search/shows?q=\(text)") else {
            
            return completionHandler(.failure(SearchAPIError.badURLName))
        }
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
    
    
}
