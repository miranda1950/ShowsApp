//
//  DetailsViewModel.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI


final class DetailsViewModel<T>: ObservableObject {
    
    var data: T
    let cast: [CastAPIResponse]
    
    var onDissmised: (()-> Void)?
    
    init(data: T, cast: [CastAPIResponse]) {
        
        self.data = data
        self.cast = cast
    }
    
    func dismiss() {
        onDissmised?()
    }
    
    
}
