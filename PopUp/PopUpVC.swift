//
//  PopUpVC.swift
//  collectionViewWWDC
//
//  Created by apple on 12/16/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {
    
    @IBOutlet var popUpView: UIView!
    
    @IBOutlet weak var btn_cancelPopUp: UIButton!
    
    
    @IBAction func btn_cancelPopOver(_ sender: Any) {
        // self.popUpView.willRemoveSubview(popUpView)
        
//        UIView.animate(withDuration: 0.1) {
//            self.popUpView.removeFromSuperview()
//
//        }
        self.popUpView.removeFromSuperview()
      //  self.popUpView.isHidden = true
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.backgroundColor = UIColor.gray
        popUpView.layer.cornerRadius = 10
        popUpView.layer.borderColor = UIColor.yellow.cgColor
        
    }
    
    
    
    @IBAction func btn_click(_ sender: Any) {
      self.view.addSubview(popUpView)
      self.popUpView.center = view.center
    //  self.popUpView.isHidden = false
    }

}
