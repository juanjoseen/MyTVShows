//
//  ColorExtension.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

extension UIColor {
    
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    static let textColor: UIColor = rgba(42, 55, 84)
}
