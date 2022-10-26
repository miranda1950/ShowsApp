//
//  CastAPIService.swift
//  ShowsApp
//
//  Created by COBE on 25.10.2022..
//

import Foundation

final class CastAPIService: CastAPIServiceProtocol {
    
    private let dataService: DataServiceProtocol = DataService()
    
    init() { }
    
    func fetchShowsSchedule(for movie: Int, completionHandler: @escaping (Result<[CastAPIResponse], Error>) -> Void) {
        
        guard let url = URL(string: "https://api.tvmaze.com/shows/\(movie)/cast") else {
            
            return completionHandler(.failure(CastAPIError.badURLName))
        }
        
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
        
    }
    
    
    
    
}
