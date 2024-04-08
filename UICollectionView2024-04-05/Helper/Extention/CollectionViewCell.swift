//
//  CollectionViewCell.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import UIKit

//Animate Extention
extension UICollectionViewCell {
    
    public static var IDENTIFIER: String {
        return String(describing: self)
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
//            self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
    
    
    
}
