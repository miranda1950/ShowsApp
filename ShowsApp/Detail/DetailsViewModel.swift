//
//  DetailsViewModel.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI


final class DetailsViewModel<T>: ObservableObject {
    
    var data: T
    
    var onDissmised: (()-> Void)?
    
    init(data: T) {
        
        self.data = data
        
    }
    
    func dismiss() {
        onDissmised?()
    }
    
    
}
