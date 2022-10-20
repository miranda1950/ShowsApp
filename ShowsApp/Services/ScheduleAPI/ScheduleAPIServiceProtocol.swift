//
//  ScheduleAPIServiceProtocol.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import Foundation

protocol ScheduleAPIServiceProtocol: AnyObject {
    
    func fetchShowsSchedule(completionHandler: @escaping (Result<[ScheduleAPIResponse], Error>) -> Void)
}
