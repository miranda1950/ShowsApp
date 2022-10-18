//
//  DataServiceError.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import Foundation

enum DataServiceError: Error {
    case badURL
    case noInternet
    case badJSON
    
}
