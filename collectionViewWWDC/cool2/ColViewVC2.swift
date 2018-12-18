//
//  ColViewVC2.swift
//  collectionViewWWDC
//
//  Created by apple on 1/1/01.
//  Copyright © 2001 apple. All rights reserved.
//

import UIKit

class ColViewVC2: UIViewController {
    
    
    @IBOutlet weak var CollectionView2: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
CollectionView2.delegate = self
CollectionView2.dataSource = self
        
    }
    

    
}

extension ColViewVC2 : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView2.dequeueReusableCell(withReuseIdentifier: "CVCell2", for: indexPath) as! CVCell2
        cell.lbl_count.text = "\(indexPath.row)"
        cell.view1.backgroundColor = UIColor.red
        cell.lbl_count.textColor = UIColor.white
        cell.lbl_count.textAlignment = .center
        return cell
    }
    
}
