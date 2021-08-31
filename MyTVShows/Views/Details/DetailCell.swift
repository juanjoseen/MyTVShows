//
//  DetailCell.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailCell: UICollectionViewCell {
    required init?(coder:NSCoder) {
        fatalError()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = .clear
    }
    
    func config(model: TvShow, controller: DetailsViewController){}
}
