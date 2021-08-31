//
//  DetailExternalCell.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailExternalCell: DetailCell {
    
    private let padding: CGFloat = 16
    
    private weak var stackView: UIStackView?
    
    var model: TvShow!
    var controller: DetailsViewController!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let lblTitle: UILabel = UIFactory.getLabel(text: "External Links", color: .textColor, font: .title())
        
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        self.stackView = stackView
        
        addSubview(lblTitle)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            lblTitle.heightAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config(model: TvShow, controller: DetailsViewController) {
        self.model = model
        self.controller = controller
        if let _: String = model.externals.imdb {
            let btnImdb: UIButton = UIFactory.getButton(text: "IMDB", textColor: .white, font: .title(), backgroundColor: .rgba(13, 37, 63))
            btnImdb.layer.cornerRadius = 12
            btnImdb.addTarget(self, action: #selector(openImdb), for: .touchUpInside)
            stackView?.addArrangedSubview(btnImdb)
        }
        
        if let _ =  model.externals.thetvdb {
            let btnTvDB: UIButton = UIFactory.getButton(text: "tv db", textColor: .white, font: .title(), backgroundColor: .rgba(56, 142, 60))
            btnTvDB.layer.cornerRadius = 12
            btnTvDB.addTarget(self, action: #selector(openTheTvDb), for: .touchUpInside)
            stackView?.addArrangedSubview(btnTvDB)
        }
    }
    
    @objc func openImdb() {
        controller.openIMDBWith(id: model.externals.imdb!)
    }
    
    @objc func openTheTvDb() {
        controller.openTheTvDbWith(id: model.externals.thetvdb!)
    }

}
