//
//  ShowsAPIServiceProtocol.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import Foundation

protocol ShowsAPIServiceProtocol: AnyObject {
    
    func fetchShow(completionHandler: @escaping (Result<ShowsAPIResponse, Error>) -> Void)
    
}
