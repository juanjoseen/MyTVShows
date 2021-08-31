//
//  MainViewController.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var mainView: MainView?
    
    var titleDelegate: TitleControllerDelegate?
    
    var shows: [TvShow] = []
    
    
    
    override func loadView() {
        let mainView: MainView = MainView(controller: self)
        self.mainView = mainView
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Api.shared.getAllShows { shows, error in
            if let error = error {
                print(error)
            } else {
                self.shows = shows
            }
            DispatchQueue.main.async {
                self.mainView?.tableView?.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleDelegate?.setTitle("Tv Shows")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainView?.tableView?.reloadData()
    }
    
    func detailsOf(_ model: TvShow) {
        navigationController?.pushViewController(DetailsViewController(model: model), animated: true)
    }

}
