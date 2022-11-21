//
//  FavoritesCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import SwiftUI


final class FavoritesCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var childCoordinator: [Coordinator]?
    
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
        
        let vm = FavoritesViewModel<Any>(persistanceService: PersistanceService(),showsAPIResponse: ShowsAPIResponse.defaultShowData,castAPIService: CastAPIService())
        
        let viewController = UIHostingController(rootView: FavoritesView(viewModel: vm))
        
        vm.onGoToDetails = { [weak self] movie, cast in
            self?.goToDetails(name: movie, cast: cast)
            
        }
        
        return viewController
    }
    
    private func goToDetails(name: ShowsAPIResponse, cast: [CastAPIResponse]) {
        
        let detailCoordinator = DetailCoordinator(data: name, cast: cast)
        childCoordinator?.append(detailCoordinator)
        let detailViewController = detailCoordinator.start()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
