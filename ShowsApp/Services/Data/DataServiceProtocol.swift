//
//  DataServiceProtocol.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import Foundation

protocol DataServiceProtocol: AnyObject {
    
    func fetchJSON<T>(from url: URL?, completionHandler: @escaping (Result<T, Error>)-> Void) where T: Decodable
    
}
