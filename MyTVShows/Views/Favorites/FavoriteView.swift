//
//  FavoriteView.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class FavoriteView: UIView {

    unowned var controller: FavoritesViewController!
    
    weak var tableView: UITableView?
    
    init(controller: FavoritesViewController) {
        self.controller = controller
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(TvShowCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.tableView = tableView
        
        addSubview(tableView)
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: topAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoriteView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model: TvShow = controller.favorites[indexPath.row]
        let cell: TvShowCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TvShowCell
        cell.config(model: model, controller: controller)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let model: TvShow = self.controller.favorites[indexPath.row]
        
        let delAction: UITableViewRowAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            self.controller.confirmDeletionOf(model) {
                self.tableView?.reloadData()
            }
        }
        return [delAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        tableView.deselectRow(at: indexPath, animated: true)
        let model: TvShow = self.controller.favorites[indexPath.row]
        controller.navigationController?.pushViewController(DetailsViewController(model: model), animated: true)
    }
}
