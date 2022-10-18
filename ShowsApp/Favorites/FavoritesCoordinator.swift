//
//  FavoritesCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import SwiftUI


final class FavoritesCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() -> UIViewController {
        let vc = createFavoritesViewController()
       
        let navigationController = UINavigationController(rootViewController: vc)
        self.navigationController = navigationController
        
        vc.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        return navigationController
    }
    
    func createFavoritesViewController() -> UIViewController {
        
        let vm = FavoritesViewModel()
        
        let viewController = UIHostingController(rootView: FavoritesView())
        
        return viewController
    }
}
