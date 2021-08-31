//
//  DetailModel.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailModel {
    let reusableIdentifier: String
    let height: CGFloat
    var model: TvShow

    init(reusableIdentifier: String, height: CGFloat, model: TvShow) {
        self.reusableIdentifier = reusableIdentifier
        self.height = height
        self.model = model
    }
}
