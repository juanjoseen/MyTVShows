//
//  TvShowCell.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class TvShowCell: UITableViewCell {
    
    private let padding: CGFloat = 8
    
    private weak var imgPortada: UIImageView?
    private weak var lblName: UILabel?
    private weak var imgFav: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        accessoryType = .disclosureIndicator
        
        let imgPortada: UIImageView = UIFactory.getImageView(contentMode: .scaleAspectFill)
        self.imgPortada = imgPortada
        
        let lblName: UILabel = UIFactory.getLabel(color: .textColor, font: .largeTitle(), alignment: .left)
        self.lblName = lblName
        
        contentView.addSubview(imgPortada)
        contentView.addSubview(lblName)
        
        NSLayoutConstraint.activate([
            imgPortada.heightAnchor.constraint(equalToConstant: 60),
            imgPortada.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imgPortada.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imgPortada.widthAnchor.constraint(equalTo: imgPortada.heightAnchor, multiplier: 0.71),
            imgPortada.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            
            lblName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            lblName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            lblName.leadingAnchor.constraint(equalTo: imgPortada.trailingAnchor, constant: padding),
            lblName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(model: TvShow, controller: MainViewController, isFavorite: Bool) {
        imgPortada?.image = nil
        let url: String = model.image.medium
        imgPortada?.cacheImage(urlString: url)
        
        lblName?.text = model.name
    }
    
    func config(model: TvShow, controller: FavoritesViewController) {
        imgPortada?.image = nil
        let url: String = model.image.medium
        imgPortada?.cacheImage(urlString: url)
        
        lblName?.text = model.name
    }

}
