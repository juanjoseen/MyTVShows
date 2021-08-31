//
//  UIFactory.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

class UIFactory {
    
    static func getImageView(withImage image: UIImage? = nil, contentMode mode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        let imgView:UIImageView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .clear
        imgView.clipsToBounds = true
        imgView.contentMode = mode
        imgView.image = image
        
        return imgView
    }
    
    static func getView(backgroundColor: UIColor = .clear, radius: Int = 0, interactive: Bool = true) -> UIView {
        let view:UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundColor
        view.isUserInteractionEnabled = interactive
        view.layer.cornerRadius = CGFloat(radius)
        return view
    }
    
    static func getLabel(text: String? = nil, color: UIColor = .white, font: UIFont = .normal(15), alignment: NSTextAlignment = .left) -> UILabel {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = alignment
        label.textColor = color
        label.font = font
        label.text = text
        label.numberOfLines = 0
        return label
    }
    
    static func getButton(image: UIImage? = nil, backgroundColor: UIColor = .clear, animated: Bool = true, interactive: Bool = true) -> UIButton {
        let button:UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = interactive
        button.backgroundColor = backgroundColor
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.clipsToBounds = true
        button.clipsToBounds = true
        
        if image != nil {
            button.setImage(image, for: .normal)
        }
        
        if animated {
            button.addTarget(self, action: #selector(animatePressDown(_:)), for: .touchDown)
            button.addTarget(self, action: #selector(animatePressUp(_:)), for: .touchUpInside)
            button.addTarget(self, action: #selector(animatePressUp(_:)), for: .touchUpOutside)
            button.addTarget(self, action: #selector(animatePressUp(_:)), for: .touchCancel)
        }
        return button
    }
    
    static func getButton(text:String = "", textColor: UIColor = .white, font: UIFont = .medium(17), backgroundColor: UIColor = .clear, animated: Bool = true, interactive: Bool = true) -> UIButton {
        let button:UIButton = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = interactive
        button.backgroundColor = backgroundColor
        button.clipsToBounds = true
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = font
        
        if animated {
            button.addTarget(self, action: #selector(animatePressDown(_:)), for: .touchDown)
            button.addTarget(self, action: #selector(animatePressUp(_:)), for: .touchUpInside)
            button.addTarget(self, action: #selector(animatePressUp(_:)), for: .touchUpOutside)
            button.addTarget(self, action: #selector(animatePressUp(_:)), for: .touchCancel)
        }
        
        return button
    }
    
    static func getCollectionLayout(direction: UICollectionView.ScrollDirection = .vertical, itemSpacing: CGFloat = 0, lineSpacing: CGFloat = 0, headerSize: CGSize = .zero, footerSize: CGSize = .zero, inset: UIEdgeInsets = .zero) -> UICollectionViewFlowLayout {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = itemSpacing
        layout.footerReferenceSize = footerSize
        layout.headerReferenceSize = headerSize
        layout.minimumLineSpacing = lineSpacing
        layout.scrollDirection = direction
        layout.sectionInset = inset
        return layout
    }
    
    static func getCollectionView(layout: UICollectionViewFlowLayout? = nil, backgroundColor: UIColor = .clear) -> UICollectionView {
        let collecion:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout ?? getCollectionLayout())
        collecion.translatesAutoresizingMaskIntoConstraints = false
        collecion.backgroundColor = backgroundColor
        
        return collecion
    }
}

// MARK: - Private Methods -
private extension UIFactory {
    
    // MARK: Animations
    @objc static func animatePressDown(_ sender: UIView) {
        Animator.animatePressDown(sender)
    }

    @objc static func animatePressUp(_ sender: UIView) {
        Animator.animatePressUp(sender)
    }
}

