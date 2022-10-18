//
//  ShowsAPIService.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import Foundation


final class ShowsAPIService: ShowsAPIServiceProtocol {
    
    private let dataService: DataServiceProtocol = DataService()
    
    init() { }
    
    func fetchShow(completionHandler: @escaping (Result<ShowsAPIResponse, Error>) -> Void) {
        
        guard let url = URL(string: "http://api.tvmaze.com") else {
            return completionHandler(.failure(ShowsAPIError.badURLName))
        }
        
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
    
   
    
}
