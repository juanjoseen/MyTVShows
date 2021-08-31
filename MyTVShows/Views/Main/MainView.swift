//
//  MainView.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class MainView: UIView {

    unowned var controller: MainViewController!
    
    weak var tableView: UITableView?
    
    init(controller: MainViewController) {
        self.controller = controller
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TvShowCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
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

extension MainView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model: TvShow = controller.shows[indexPath.row]
        let isFavorite: Bool = controller.isFavoriteShow(model)
        
        let cell: TvShowCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TvShowCell
        cell.config(model: model, controller: controller, isFavorite: isFavorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let model: TvShow = self.controller.shows[indexPath.row]
        let isFavorite: Bool = controller.isFavoriteShow(model)
        
        if isFavorite {
            let delAction: UITableViewRowAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                self.controller.confirmDeletionOf(model) {
                    self.tableView?.reloadData()
                }
            }
            return [delAction]
        } else {
            let favAction: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "Favorite") { (action, indexPath) in
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                self.controller.markAsFavorite(model) {
                    self.tableView?.reloadData()
                }
            }
            favAction.backgroundColor = .systemGreen
            return [favAction]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        tableView.deselectRow(at: indexPath, animated: true)
        let model: TvShow = self.controller.shows[indexPath.row]
        controller.detailsOf(model)
    }
}
