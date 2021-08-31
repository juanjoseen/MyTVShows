//
//  DetailOverviewModel.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailOverviewModel: DetailModel {
    let kCellHeight: CGFloat = 0
    
    init(with model: TvShow) {
        super.init(reusableIdentifier: DetailOverviewCell.reusableIdentifier(), height: kCellHeight, model: model)
    }
}
