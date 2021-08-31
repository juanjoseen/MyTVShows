//
//  DetailExtraCell.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 31/08/21.
//

import UIKit

class DetailExtraCell: DetailCell {
    
    private let padding: CGFloat = 16
    
    private weak var lblLanguage: UILabel?
    private weak var lblStatus: UILabel?
    private weak var lblSchedule: UILabel?
    
    var model: TvShow!
    var controller: DetailsViewController!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let language: UILabel = UIFactory.getLabel(text: "Language:", color: .textColor, font: .text())
        
        let lblLanguage: UILabel = UIFactory.getLabel(color: .textColor, font: .subtitle())
        self.lblLanguage = lblLanguage
        
        let status: UILabel = UIFactory.getLabel(text: "Status:", color: .textColor, font: .text())
        
        let lblStatus: UILabel = UIFactory.getLabel(color: .textColor, font: .subtitle())
        self.lblStatus = lblStatus
        
        let schedule: UILabel = UIFactory.getLabel(text: "Schedule:", color: .textColor, font: .text())
        
        let lblSchedule: UILabel = UIFactory.getLabel(color: .textColor, font: .subtitle())
        self.lblSchedule = lblSchedule
        
        addSubview(language)
        addSubview(lblLanguage)
        addSubview(status)
        addSubview(lblStatus)
        addSubview(schedule)
        addSubview(lblSchedule)
        
        NSLayoutConstraint.activate([
            language.topAnchor.constraint(equalTo: topAnchor, constant: padding / 2),
            language.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            language.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            lblLanguage.topAnchor.constraint(equalTo: language.bottomAnchor),
            lblLanguage.trailingAnchor.constraint(equalTo: language.trailingAnchor),
            lblLanguage.leadingAnchor.constraint(equalTo: language.leadingAnchor, constant: padding),
            
            status.leadingAnchor.constraint(equalTo: language.leadingAnchor),
            status.trailingAnchor.constraint(equalTo: language.trailingAnchor),
            status.topAnchor.constraint(equalTo: lblLanguage.bottomAnchor, constant: padding),
            
            lblStatus.topAnchor.constraint(equalTo: status.bottomAnchor),
            lblStatus.trailingAnchor.constraint(equalTo: status.trailingAnchor),
            lblStatus.leadingAnchor.constraint(equalTo: lblLanguage.leadingAnchor),
            
            schedule.topAnchor.constraint(equalTo: lblStatus.bottomAnchor, constant: padding),
            schedule.leadingAnchor.constraint(equalTo: status.leadingAnchor),
            schedule.trailingAnchor.constraint(equalTo: status.trailingAnchor),
            
            lblSchedule.topAnchor.constraint(equalTo: schedule.bottomAnchor),
            lblSchedule.leadingAnchor.constraint(equalTo: lblStatus.leadingAnchor),
            lblSchedule.trailingAnchor.constraint(equalTo: schedule.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config(model: TvShow, controller: DetailsViewController) {
        self.model = model
        self.controller = controller
        
        lblLanguage?.text = model.language
        lblStatus?.text = model.status
        
        lblSchedule?.text = String(format: "%@ at %@", model.schedule.days.map({ $0 }).joined(separator: ", "), model.schedule.time)
        
    }
}
