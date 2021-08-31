//
//  FontExtension.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

extension UIFont {
    
    static func normal(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir", size: size)!
    }
    
    static func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size)!
    }
    
    static func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-LightOblique", size: size)!
    }
    
    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: size)!
    }
    
    static func heavy(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size)!
    }
    
    static func largeTitle(_ size: CGFloat = 25) -> UIFont {
        return .heavy(size)
    }
    
    static func title(_ size: CGFloat = 20) -> UIFont {
        return .heavy(size)
    }
    
    static func subtitle(_ size: CGFloat = 17) -> UIFont {
        return .medium(size)
    }
    
    static func text(_ size: CGFloat = 15) -> UIFont {
        return .normal(size)
    }
    
    static func smallText(_ size: CGFloat = 12) -> UIFont {
        return .light(size)
    }
}
