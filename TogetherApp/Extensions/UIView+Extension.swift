//
//  UIView+Extension.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

extension UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func addBorder(width: CGFloat = .pixel,
                   color: UIColor = UIColor(red:0.20, green:0.23, blue:0.30, alpha:1.0)) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}

extension CGFloat {
    static let pixel = 1 / UIScreen.main.scale
}
