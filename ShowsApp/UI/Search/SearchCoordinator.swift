//
//  SearchCoordinator.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI

final class SearchCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator]?
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
        let vm = SearchViewModel<Any>(searchAPIService: searchAPIService(),showsAPIResponse: ShowsAPIResponse.defaultShowData,castAPIService: CastAPIService())
        let viewController = UIHostingController(rootView: SearchView(viewModel: vm))
        
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
