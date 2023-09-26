//
//  UIView+Ext.swift
//  SkyInfo
//
//  Created by Enes Sancar on 25.09.2023.
//

import UIKit

extension UIView {
    
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    public func addSubviewsList(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
