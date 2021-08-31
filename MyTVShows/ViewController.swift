//
//  ViewController.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

protocol TitleControllerDelegate {
    func setTitle(_ title: String)
}

class ViewController: UITabBarController, TitleControllerDelegate {
    
    func setTitle(_ title: String) {
        
        self.title = title
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .rgba(88, 86, 214)
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        
        let main: UITabBarItem = UITabBarItem(title: "TV Shows", image: UIImage(named: "tv"), selectedImage: UIImage(named: "tv_active"))
        let fav: UITabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "heart"), selectedImage: UIImage(named: "heart_active"))
        
        let mainVC: MainViewController = MainViewController()
        mainVC.titleDelegate = self
        mainVC.tabBarItem = main
        
        let favVC: FavoritesViewController = FavoritesViewController()
        favVC.titleDelegate = self
        favVC.tabBarItem = fav
        
        self.viewControllers = [
            mainVC,
            favVC
        ]
    }


}

