//
//  NewsItemsController.swift
//  collectionViewWWDC
//
//  Created by apple on 12/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit



class NewsItemsController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    let items = ["A target written in Swift 4 can depend on a target that’s written in Swift 3, and vice versa. This means, if you have a large project that’s divided into multiple frameworks, you can migrate your code from Swift 3 to Swift 4 one framework at a time.","A target written in Swift 4 can depend on a target that’s written in Swift 3, and vice versa. This means, if you have a large project that’s divided into multiple frameworks, you can migrate your code from Swift 3 to Swift 4 one framework at a time.","A target written in Swift 4 can depend on a target that’s written in Swift 3, and vice versa. This means, if you have a large project that’s divided into multiple frameworks, you can migrate your code from Swift 3 to Swift 4 one framework at a time.","A target written in Swift 4 can depend on a target that’s written in Swift 3, and vice versa. This means, if you have a large project that’s divided into multiple frameworks, you can migrate your code from Swift 3 to Swift 4 one framework at a time."]
    
    let cellid = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: cellid)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! NewsCell
       // cell.backgroundColor = UIColor.red
        cell.label.text = items[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)

    }

  

}

class NewsCell : UICollectionViewCell{
    
    let label : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16   )
       return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // backgroundColor = UIColor.darkGray
        label.numberOfLines = 0
        addSubview(label)
        label.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
    
    
}
