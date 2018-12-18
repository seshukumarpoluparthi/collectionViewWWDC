//
//  PracticeVC1.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class PracticeVC1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        
        let blueview = UIView()
        blueview.backgroundColor = UIColor.blue
        let greenview = UIView()
        greenview.backgroundColor = UIColor.green
        
        [blueview , redView , greenview].forEach {view.addSubview($0)}
        
        //        view.addSubview(blueview)
        //        view.addSubview(redView)
        
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12), size: CGSize(width: 125, height: 0))
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        blueview.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: redView.trailingAnchor, padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0))
        blueview.anchorSize(to: redView)
        greenview.anchor(top: redView.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: blueview.bottomAnchor, trailing:  redView.leadingAnchor , padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
        
        let purpleview = UIView()
        purpleview.backgroundColor = UIColor.purple
        view.addSubview(purpleview)
        purpleview.fillSuperview()
        view.sendSubviewToBack(purpleview)
        // enables auto layout
        //        redView.translatesAutoresizingMaskIntoConstraints = false
        //        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        //  redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) , size: CGSize(width: 100, height: 100))
    }
}

extension UIView{
    
    func fillSuperview()  {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view : UIView)  {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top : NSLayoutYAxisAnchor? , leading : NSLayoutXAxisAnchor? ,bottom : NSLayoutYAxisAnchor? , trailing : NSLayoutXAxisAnchor? , padding : UIEdgeInsets = .zero , size : CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        /*
         topAnchor.constraint(equalTo: top).isActive = true
         leadingAnchor.constraint(equalTo: leading).isActive = true
         bottomAnchor.constraint(equalTo: bottom).isActive = true
         trailingAnchor.constraint(equalTo: trailing).isActive = true
         */
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}
