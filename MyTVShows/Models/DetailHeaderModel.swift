//
//  DetailHeaderModel.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailHeaderModel: DetailModel {
    let kCellHeight: CGFloat = 250
    
    init(with model: TvShow) {
        super.init(reusableIdentifier: DetailHeaderCell.reusableIdentifier(), height: kCellHeight, model: model)
    }
}
