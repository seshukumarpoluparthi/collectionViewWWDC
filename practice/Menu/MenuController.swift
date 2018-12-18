//
//  MenuController.swift
//  collectionViewWWDC
//
//  Created by apple on 12/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate {
    func didTapMenuItem(indexPath : IndexPath)
}




class MenuController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    fileprivate let cellId = "cellId"
    fileprivate let menuItems = ["News","Home","Popular"]
    
    var deleagte : MenuControllerDelegate?
    
    
     let menuBar : UIView = {
     let v = UIView()
     v.backgroundColor = UIColor.black
     return v
    }()
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = view.frame.width/3 * CGFloat(indexPath.item)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuBar.transform = CGAffineTransform(translationX: x, y: 0)
        })
        deleagte?.didTapMenuItem(indexPath: indexPath)
        
        
        
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsSelection = true
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor.white
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
        
        view.addSubview(menuBar)
        menuBar.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, size: CGSize(width: 0, height: 5))
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.label.text = menuItems[indexPath.row]
        
//        if indexPath.item == 0{
//            cell.label.text = "News"
//        } else if indexPath.item == 1{
//            cell.label.text = "Home"
//        } else{
//            cell.label.text = "Popular"
//        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width/3, height: view.frame.height)
    }
      
}


