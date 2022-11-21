//
//  HomeCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI
import UIKit

final class HomeCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator]?
    var navigationController: UINavigationController?
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() -> UIViewController {
        let vc = createHomeViewController()
        
        let navigationController = UINavigationController(rootViewController: vc)
        self.navigationController = navigationController
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        
        return navigationController
    }
    
    private func createHomeViewController()->UIViewController {
        let vm = HomeViewModel<Any>(showsAPIService: ShowsAPIService(),scheduleAPIService: ScheduleAPIService(), castAPIService: CastAPIService(), persistanceService: PersistanceService())
        let viewController = UIHostingController(rootView: HomeView(viewModel: vm))
        
        
        vm.onGoToDetails = { [weak self] movie, cast in
            self?.goToDetails(name: movie, cast: cast)
        }
        return viewController
    }
    
    private func goToDetails<T>(name: T, cast: [CastAPIResponse]) {
        
        let detailCoordinator = DetailCoordinator(data: name, cast: cast)
        childCoordinator?.append(detailCoordinator)
        let detailViewController = detailCoordinator.start()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}
