//
//  MenuCell.swift
//  collectionViewWWDC
//
//  Created by apple on 12/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit

class MenuCell : UICollectionViewCell{
    let label : UILabel = {
        let l = UILabel()
        l.text = "Menu Item"
        l.textAlignment = .center
        l.textColor = UIColor.lightGray
        return l
    }()
    
    
    override var isSelected: Bool{
        
        didSet{
            label.textColor = isSelected ? UIColor.black : UIColor.lightGray
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
