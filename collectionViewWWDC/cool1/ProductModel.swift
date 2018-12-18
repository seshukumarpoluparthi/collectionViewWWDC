//
//  ProductModel.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit


struct ModelProduct : Codable {
    let code : String?
    let Message : String?
    let Data : [product_obj]
}


struct product_obj : Codable {
    let _id : String
    let name : String
    let quantity : Int
    let price : String
    let image : String
    let currency : String?
    let overview : String
    let UpdatedTime : String
    let CreatedTime : String
    let active : Bool?
}
