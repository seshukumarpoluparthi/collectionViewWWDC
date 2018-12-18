//
//  UIViewExtensions.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func addShadowandRoundCorners() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
       layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
