//
//  DetailExtraModel.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 31/08/21.
//

import UIKit

class DetailExtraModel: DetailModel {
    let kCellHeight: CGFloat = 180
    
    init(with model: TvShow) {
        super.init(reusableIdentifier: DetailExtraCell.reusableIdentifier(), height: kCellHeight, model: model)
    }
}
