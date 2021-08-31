//
//  DetailsViewController.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var model: TvShow!
    
    weak var detailView: DetailView?
    
    var models: [DetailModel] = []
    
    convenience init(model: TvShow) {
        self.init()
        self.model = model
    }
    
    override func loadView() {
        let detailView: DetailView = DetailView(controller: self)
        self.detailView = detailView
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = model.name
        let title: String = isFavoriteShow(model) ? "Delete" : "Favorite"
        let btnFav: UIBarButtonItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(setAsFavorite))
        navigationItem.rightBarButtonItem = btnFav
        
        models = [
            DetailHeaderModel(with: model),
            DetailOverviewModel(with: model),
            DetailExtraModel(with: model),
        ]
        
        if model.externals.imdb != nil || model.externals.thetvdb != nil {
            models.insert(DetailExternalModel(with: model), at: 2)
        }
    }
    
    func openIMDBWith(id: String) {
        let url: URL = URL(string: String(format: "https://www.imdb.com/title/%@", id))!
        UIApplication.shared.open(url)
    }
    
    func openTheTvDbWith(id: Int) {
        let url: URL = URL(string: String(format: "https://www.thetvdb.com/?id=%d&tab=series", id))!
        UIApplication.shared.open(url)
    }
    
    @objc func setAsFavorite() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        if isFavoriteShow(model) {
            confirmDeletionOf(model) {
                self.setRightTitle()
            }
        } else {
            markAsFavorite(model) {
                self.setRightTitle()
            }
        }
    }
    
    private func setRightTitle() {
        if isFavoriteShow(model) {
            self.navigationItem.rightBarButtonItem?.title = "Delete"
        } else {
            self.navigationItem.rightBarButtonItem?.title = "Favorite"
        }
    }
}
