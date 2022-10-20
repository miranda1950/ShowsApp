//
//  HomeViewModel.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    private let showsAPIService: ShowsAPIServiceProtocol
   @Published var movies = [ShowsAPIResponse] ()
    @State private var image = UIImage()
    
    
    init(showsAPIService: ShowsAPIServiceProtocol){
        
        self.showsAPIService = showsAPIService
        
        
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
    
    
}


