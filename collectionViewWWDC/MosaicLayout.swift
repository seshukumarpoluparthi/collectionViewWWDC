//
//  MosaicLayout.swift
//  collectionViewWWDC
//
//  Created by apple on 11/24/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MosaicLayout: UICollectionViewFlowLayout {
    
    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else {
            return
        }
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: cv.bounds.size)
    }
}
