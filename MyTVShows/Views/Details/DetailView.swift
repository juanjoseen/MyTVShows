//
//  DetailView.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailView: UIView {

    unowned var controller: DetailsViewController!
    
    weak var collection: UICollectionView?
    
    init(controller: DetailsViewController) {
        self.controller = controller
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        let collection: UICollectionView = UIFactory.getCollectionView()
        collection.register(DetailHeaderCell.self, forCellWithReuseIdentifier: DetailHeaderCell.reusableIdentifier())
        collection.register(DetailOverviewCell.self, forCellWithReuseIdentifier: DetailOverviewCell.reusableIdentifier())
        collection.register(DetailExternalCell.self, forCellWithReuseIdentifier: DetailExternalCell.reusableIdentifier())
        collection.register(DetailExtraCell.self, forCellWithReuseIdentifier: DetailExtraCell.reusableIdentifier())
        collection.delegate = self
        collection.dataSource = self
        self.collection = collection
        
        addSubview(collection)
        
        var constraints: [NSLayoutConstraint] = [
            collection.bottomAnchor.constraint(equalTo: bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]
        
        if #available(iOS 11.0, *) {
            constraints.append(collection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor))
        } else {
            constraints.append(collection.topAnchor.constraint(equalTo: topAnchor))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model: DetailModel = controller.models[indexPath.row]
        let cell: DetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reusableIdentifier, for: indexPath) as! DetailCell
        cell.config(model: model.model, controller: controller)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model: DetailModel = controller.models[indexPath.row]
        let width: CGFloat = collectionView.frame.width
        var height: CGFloat = model.height
        
        if model.reusableIdentifier == DetailOverviewCell.reusableIdentifier() {
            height = min(model.model.overview.height(width: collectionView.frame.size.width - 32, font: .title()) + 25, 250)
        }
        
        return CGSize(width: width, height: height)
    }
}
