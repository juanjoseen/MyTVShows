//
//  DetailExternalModel.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailExternalModel: DetailModel {
    let kCellHeight: CGFloat = 120
    
    init(with model: TvShow) {
        super.init(reusableIdentifier: DetailExternalCell.reusableIdentifier(), height: kCellHeight, model: model)
    }
}
