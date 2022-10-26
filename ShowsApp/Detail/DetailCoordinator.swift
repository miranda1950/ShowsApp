//
//  DetailCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI

final class DetailCoordinator<T>: Coordinator {
    
    var onDismissed: (() -> Void)?
    let data: T
    let cast: [CastAPIResponse]
    
    init( data: T, cast: [CastAPIResponse]) {
        
        self.data = data
        self.cast = cast
    }
    
    
    func start() -> UIViewController {
        
        let vm = DetailsViewModel<T>(data: data, cast: cast)
        let vc = UIHostingController(rootView: DetailView<T>(viewModel: vm))
        
        vm.onDissmised = { [weak self] in
            self?.onDismissed?()
            
        }
        return vc
    }
}
