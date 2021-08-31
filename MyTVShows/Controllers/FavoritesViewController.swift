//
//  FavoritesViewController.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var titleDelegate: TitleControllerDelegate?
    
    weak var favView: FavoriteView?
    
    override func loadView() {
        let favView: FavoriteView = FavoriteView(controller: self)
        self.favView = favView
        view = favView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleDelegate?.setTitle("Favorites Shows")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.favView?.tableView?.reloadData()
    }

}
