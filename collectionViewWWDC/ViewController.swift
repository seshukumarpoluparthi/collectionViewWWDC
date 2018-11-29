//
//  ViewController.swift
//  collectionViewWWDC
//
//  Created by apple on 11/24/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    private var flowLayout : ColumnFlowLayout!
   private var collectionView : UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
      //  flowLayout =
     flowLayout = ColumnFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        collectionView.backgroundColor = UIColor.gray
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "seshu")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }


}
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seshu", for: indexPath)
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
}

