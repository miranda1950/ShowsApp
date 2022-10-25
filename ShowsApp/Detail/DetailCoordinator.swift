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
    
    init( data: T) {
        
        self.data = data
    }
    
    
    func start() -> UIViewController {
        
        let vm = DetailsViewModel<T>(data: data)
        let vc = UIHostingController(rootView: DetailView<T>(viewModel: vm))
        
        vm.onDissmised = { [weak self] in
            self?.onDismissed?()
            
        }
        return vc
    }
}
