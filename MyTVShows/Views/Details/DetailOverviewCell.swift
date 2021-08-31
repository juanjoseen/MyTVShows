//
//  DetailOverviewCell.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailOverviewCell: DetailCell {
    private let padding: CGFloat = 16
    weak var lblOverview: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let lblTitle: UILabel = UIFactory.getLabel(text: "Overview", color: .textColor, font: .title(), alignment: .center)
        
        let lblOverview: UILabel = UIFactory.getLabel(color: .textColor, font: .text())
        lblOverview.numberOfLines = 16
        
        self.lblOverview = lblOverview
        
        addSubview(lblTitle)
        addSubview(lblOverview)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: topAnchor),
            lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            lblOverview.topAnchor.constraint(equalTo: lblTitle.bottomAnchor),
            lblOverview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            lblOverview.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblOverview.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config(model: TvShow, controller: DetailsViewController) {
        lblOverview?.text = model.overview
    }
}
