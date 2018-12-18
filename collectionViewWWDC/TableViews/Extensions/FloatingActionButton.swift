//
//  FloatingActionButton.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class FloatingActionButton: UIButton {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
       layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height/2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }


}
