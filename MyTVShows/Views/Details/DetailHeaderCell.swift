//
//  DetailHeaderCell.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class DetailHeaderCell: DetailCell {
    
    private let padding: CGFloat = 16
    
    private weak var bgImage: UIImageView?
    private weak var imgPortrait: UIImageView?
    private weak var lblGenresList: UILabel?
    private weak var lblRuntime: UILabel?
    private weak var lblUpdated: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let bgImage: UIImageView = UIFactory.getImageView(contentMode: .scaleToFill)
        self.bgImage = bgImage
        
        let imgPortrait: UIImageView = UIFactory.getImageView()
        self.imgPortrait = imgPortrait
        
        let effectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.translatesAutoresizingMaskIntoConstraints = false
        bgImage.addSubview(effectView)
        
        let lblGenres: UILabel = UIFactory.getLabel(text: "Genres:", font: .text())
        
        let lblGenresList: UILabel = UIFactory.getLabel(font: .subtitle())
        lblGenresList.numberOfLines = 2
        self.lblGenresList = lblGenresList
        
        let runtime: UILabel = UIFactory.getLabel(text: "Runtime:", font: .text())
        
        let lblRuntime: UILabel = UIFactory.getLabel(font: .subtitle())
        self.lblRuntime = lblRuntime
        
        let updated: UILabel = UIFactory.getLabel(text: "Updated:", font: .text())
        
        let lblUpdated: UILabel = UIFactory.getLabel(font: .subtitle())
        self.lblUpdated = lblUpdated
        
        addSubview(bgImage)
        addSubview(imgPortrait)
        addSubview(lblGenres)
        addSubview(lblGenresList)
        addSubview(runtime)
        addSubview(lblRuntime)
        addSubview(updated)
        addSubview(lblUpdated)
        
        NSLayoutConstraint.activate([
            
            bgImage.topAnchor.constraint(equalTo: topAnchor),
            bgImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            effectView.topAnchor.constraint(equalTo: bgImage.topAnchor),
            effectView.bottomAnchor.constraint(equalTo: bgImage.bottomAnchor),
            effectView.leadingAnchor.constraint(equalTo: bgImage.leadingAnchor),
            effectView.trailingAnchor.constraint(equalTo: bgImage.trailingAnchor),
            
            imgPortrait.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            imgPortrait.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            imgPortrait.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imgPortrait.widthAnchor.constraint(equalTo: imgPortrait.heightAnchor, multiplier: 0.71),
            
            lblGenres.topAnchor.constraint(equalTo: imgPortrait.topAnchor),
            lblGenres.leadingAnchor.constraint(equalTo: imgPortrait.trailingAnchor, constant: padding / 2),
            lblGenres.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding / 2),
            
            lblGenresList.topAnchor.constraint(equalTo: lblGenres.bottomAnchor),
            lblGenresList.leadingAnchor.constraint(equalTo: lblGenres.leadingAnchor, constant: padding),
            lblGenresList.trailingAnchor.constraint(equalTo: lblGenres.trailingAnchor),
            
            runtime.topAnchor.constraint(equalTo: lblGenresList.bottomAnchor, constant: padding),
            runtime.leadingAnchor.constraint(equalTo: lblGenres.leadingAnchor),
            runtime.trailingAnchor.constraint(equalTo: lblGenres.trailingAnchor),
            
            lblRuntime.topAnchor.constraint(equalTo: runtime.bottomAnchor),
            lblRuntime.leadingAnchor.constraint(equalTo: runtime.leadingAnchor, constant: padding),
            lblRuntime.trailingAnchor.constraint(equalTo: runtime.trailingAnchor),
            
            updated.topAnchor.constraint(equalTo: lblRuntime.bottomAnchor, constant: padding),
            updated.leadingAnchor.constraint(equalTo: runtime.leadingAnchor),
            updated.trailingAnchor.constraint(equalTo: runtime.trailingAnchor),
            
            lblUpdated.topAnchor.constraint(equalTo: updated.bottomAnchor),
            lblUpdated.leadingAnchor.constraint(equalTo: updated.leadingAnchor, constant: padding),
            lblUpdated.trailingAnchor.constraint(equalTo: updated.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config(model: TvShow, controller: DetailsViewController) {
        let url: String = model.image.original
        imgPortrait?.cacheImage(urlString: url)
        bgImage?.cacheImage(urlString: url)
        
        lblGenresList?.text = model.genres.map({ $0 }).joined(separator: ", ")
        if let runtime: Int = model.runtime {
            lblRuntime?.text = String(format: "%d minutes", runtime)
        } else {
            lblRuntime?.text = "-"
        }
        
        let updated: Date = Date(timeIntervalSince1970: Double(model.updated))
        let dateFromatter: DateFormatter = DateFormatter()
        dateFromatter.dateFormat = "yyyy/MM/dd"
        
        lblUpdated?.text = dateFromatter.string(from: updated)
    }
}
