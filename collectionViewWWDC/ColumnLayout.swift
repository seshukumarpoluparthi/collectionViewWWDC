//
//  ColumnLayout.swift
//  collectionViewWWDC
//
//  Created by apple on 11/24/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else {return}
        //  self.itemSize = CGSize(width:cv.bounds.inset(by: cv.layoutMargins).size.width , height: 70.0)
        //cv.bounds.inset(by: cv.layoutMargins).size.width
        
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minimumColumnWidth = CGFloat(300)
        let maxNumColumns = Int(availableWidth/minimumColumnWidth)
        let cellWidth = (availableWidth/CGFloat(maxNumColumns)).rounded(.down)
        self.itemSize = CGSize(width: cellWidth, height: 70)
        
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }
    
    
    
    
}
