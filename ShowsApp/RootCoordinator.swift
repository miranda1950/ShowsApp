//
//  RootCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import Foundation
import UIKit

final class RootCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    
    func start() -> UIViewController {
        let movieCoordinator = HomeCoordinator(navigationController: UINavigationController())
        
        childCoordinator = movieCoordinator
        let homeViewController = movieCoordinator.start()
        
        return homeViewController
    }
}
