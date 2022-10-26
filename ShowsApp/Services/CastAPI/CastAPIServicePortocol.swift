//
//  CastAPIServicePortocol.swift
//  ShowsApp
//
//  Created by COBE on 25.10.2022..
//

import Foundation


protocol CastAPIServiceProtocol: AnyObject {
    
    func fetchShowsSchedule(for movie: Int, completionHandler: @escaping (Result<[CastAPIResponse], Error>) -> Void)
}
