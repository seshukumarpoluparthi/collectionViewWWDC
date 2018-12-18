//
//  GlobalVariables.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation

class GlobalVariables{
    class var sharedManager : GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
    
    var myCartData = [carts]()
}
