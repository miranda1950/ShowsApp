//
//  SearchCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI

final class SearchCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        
        
        
        let vc = createSearchViewController()
        
        let navigationController = UINavigationController(rootViewController: vc)
        self.navigationController = navigationController
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        return navigationController
    }
    
    private func createSearchViewController()->UIViewController {
        let vm = SearchViewModel(searchAPIService: searchAPIService())
        let viewController = UIHostingController(rootView: SearchView(viewModel: vm))
        
        
        return viewController
    }
    
}
