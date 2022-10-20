//
//  MainTabBarController.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//


import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    let main = HomeCoordinator(navigationController: UINavigationController())
    let search = SearchCoordinator(navigationController: UINavigationController())
    let favorite = FavoritesCoordinator(navigationController: UINavigationController())
    
    let selectedColor = UIColor(Color("PrimaryYellow"))
    let unselectedColor = UIColor(Color("LightGray"))
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.unselectedItemTintColor = unselectedColor
        tabBar.selectedImageTintColor = selectedColor
        tabBar.backgroundColor = UIColor(Color("DarkGray"))
        
        
        main.start()
        search.start()
        favorite.start()
        
    
        
        viewControllers = [main.navigationController!, search.navigationController!,favorite.navigationController!]
        
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
