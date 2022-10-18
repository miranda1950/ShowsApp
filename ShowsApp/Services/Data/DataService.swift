//
//  DataService.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import Foundation

final class DataService: DataServiceProtocol {
    
    
    func fetchJSON<T>(from url: URL?, completionHandler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let decoder = JSONDecoder()
        
        guard let url = url else {
            return completionHandler(.failure(DataServiceError.badURL))
        }
        guard let data = try? Data(contentsOf: url) else {
            return completionHandler(.failure(DataServiceError.noInternet))
        }
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            return completionHandler(.failure(DataServiceError.badJSON))
        }
        
        completionHandler(.success(decoded))
    }
    
    
}

