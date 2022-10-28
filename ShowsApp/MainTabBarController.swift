//
//  MainTabBarController.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//


import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
    let favoriteCoordinator = FavoritesCoordinator(navigationController: UINavigationController())
    
    let selectedColor = UIColor(Color("PrimaryYellow"))
    let unselectedColor = UIColor(Color("LightGray"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.unselectedItemTintColor = unselectedColor
        UITabBar.appearance().tintColor = selectedColor
        tabBar.backgroundColor = UIColor(Color("DarkGray"))
        
        
        homeCoordinator.start()
        searchCoordinator.start()
        favoriteCoordinator.start()
        
        
        
        viewControllers = [homeCoordinator.navigationController!, searchCoordinator.navigationController!,favoriteCoordinator.navigationController!]
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
