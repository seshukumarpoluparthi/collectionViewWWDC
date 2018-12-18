//
//  SwipingViewController.swift
//  collectionViewWWDC
//
//  Created by apple on 12/8/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
class SwipingViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,MenuControllerDelegate {
    func didTapMenuItem(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    
    
    fileprivate let menuController = MenuController(collectionViewLayout : UICollectionViewFlowLayout())
    
    fileprivate let cellid = "cellid"
    fileprivate let colors : [UIColor] = [.red , .blue , .green]
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let offset = x/3
        menuController.menuBar.transform = CGAffineTransform(translationX: offset, y: 0)
    }
    
//    override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        let item = scrollView.contentOffset.x/view.frame.width
//        let indexpath = IndexPath(item: Int(item), section: 0)
//        collectionView.selectItem(at: indexpath, animated: true, scrollPosition: .bottom)
//    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let item = x/view.frame.width
        let indexpath = IndexPath(item: Int(item), section: 0)
        menuController.collectionView.selectItem(at: indexpath, animated: true, scrollPosition: .centeredHorizontally)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuController.deleagte = self
        menuController.collectionView.selectItem(at: [0,0], animated: true, scrollPosition: .centeredHorizontally)

        collectionView.allowsSelection = true
        
         view.backgroundColor = UIColor.white
         navigationItem.title = "seshu kumar"
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        setupLayout()
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: cellid)
        collectionView.isPagingEnabled = true
    }
    
    fileprivate func setupLayout() {
        let menuView = menuController.view!
        menuView.backgroundColor = UIColor.yellow
        view.addSubview(menuView)
        menuView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,  size: CGSize(width: 0, height: 60))
        collectionView.backgroundColor = UIColor.white
        collectionView.anchor(top: menuView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor , padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 ))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! MainCell
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // -60 -44
        return CGSize(width: view.frame.width, height: view.frame.height - 60 - 44 - UIApplication.shared.statusBarFrame.height)
    }
    
}
