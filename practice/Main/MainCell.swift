//
//  MainCell.swift
//  collectionViewWWDC
//
//  Created by apple on 12/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit


class MainCell: UICollectionViewCell {
    
    
    
    
    
    let newsItemController = NewsItemsController(collectionViewLayout : UICollectionViewFlowLayout())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let newsItemsView = newsItemController.view!
            addSubview(newsItemsView)
        newsItemsView.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
