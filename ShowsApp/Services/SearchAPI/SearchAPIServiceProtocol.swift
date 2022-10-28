//
//  SearchAPIServiceProtocol.swift
//  ShowsApp
//
//  Created by COBE on 27.10.2022..
//

import Foundation

protocol SearchAPIServiceProtocol: AnyObject {
    
    func fetchJSON(for text: String, completionHandler: @escaping (Result<[SearchAPIResponse], Error>) -> Void)
    
}
