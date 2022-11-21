//
//  RootCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import Foundation
import UIKit
import SwiftUI

final class RootCoordinator: Coordinator {
    
    var navigationController = UINavigationController()
    var tabBarController = UITabBarController()
    var childCoordinators = [Coordinator] ()
    var childCoordinator: Coordinator?
    
    
    func start() -> UIViewController {
        return createTabBar()
    }
    
    func createTabBar() -> UINavigationController {
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
        let favoriteCoordinator = FavoritesCoordinator(navigationController: UINavigationController())
        
        childCoordinators = [homeCoordinator, searchCoordinator, favoriteCoordinator]
        
        let selectedColor = UIColor(Color("PrimaryYellow"))
        let unselectedColor = UIColor(Color("LightGray"))
        
        tabBarController.tabBar.unselectedItemTintColor = unselectedColor
        UITabBar.appearance().tintColor = selectedColor
        tabBarController.tabBar.backgroundColor = UIColor(Color("DarkGray"))
        
        
        navigationController.viewControllers = [tabBarController]
        tabBarController.viewControllers = childCoordinators.map { coordinator  in
            coordinator.start()
        }
        return navigationController
    }
    
    
}
