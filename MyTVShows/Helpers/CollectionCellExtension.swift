//
//  CollectionCellExtension.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

extension UICollectionViewCell {
    class func reusableIdentifier() -> String {
        let classType: AnyClass = object_getClass(self)!
        return NSStringFromClass(classType)
    }
}
