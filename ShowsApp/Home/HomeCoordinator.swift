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
        //vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
       
        return navigationController
    }
    
    private func createHomeViewController()->UIViewController {
        let vm = HomeViewModel<Any>(showsAPIService: ShowsAPIService(),scheduleAPIService: ScheduleAPIService())
        let viewController = UIHostingController(rootView: HomeView(viewModel: vm))
   
        
        vm.onGoToDetails = { [weak self] movie in
            self?.goToDetails(name: movie)
        }
        return viewController
    }
    
    private func goToDetails<T>(name: T) {
        
        let detailCoordinator = DetailCoordinator(data: name)
        childCoordinator?.append(detailCoordinator)
        let detailViewController = detailCoordinator.start()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}
