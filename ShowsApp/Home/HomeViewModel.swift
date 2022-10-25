//
//  HomeViewModel.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI

final class HomeViewModel<T>: ObservableObject {
    
    private let showsAPIService: ShowsAPIServiceProtocol
    private let scheduleAPIService: ScheduleAPIServiceProtocol
    
    var onGoToDetails: ((_ movie: T) -> Void)?
    
   @Published var movies = [ShowsAPIResponse] ()
    @Published var schedule = [ScheduleAPIResponse] ()
    
    
    init(showsAPIService: ShowsAPIServiceProtocol, scheduleAPIService: ScheduleAPIServiceProtocol){
        
        self.showsAPIService = showsAPIService
        self.scheduleAPIService = scheduleAPIService
        
    }
    
    
    func loadShows() {
        showsAPIService.fetchShow() { result in
            DispatchQueue.main.async {
            switch (result) {
            case .success(let response):
                self.movies.append(contentsOf: response)
                
            case .failure(let error):
              print("error: \( error.localizedDescription)")
            }
        }
            
            
        }
        
        
    }
    func loadSchedule() {
        scheduleAPIService.fetchShowsSchedule() { result in
            
            DispatchQueue.main.async {
                switch (result) {
                case .success(let response):
               self.schedule.append(contentsOf: response)
                    print(self.schedule)
                case .failure(let error):
                    print("error: \(error.localizedDescription) ")
                }
            }
        }
    }
    
    
}


