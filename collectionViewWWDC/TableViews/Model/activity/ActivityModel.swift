//
//  ActivityModel.swift
//  collectionViewWWDC
//
//  Created by apple on 12/9/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit


struct ActivityModel {
    var id : String!
    var title = ""
    var subTitle = ""
    var activityType : ActivityType
    var photo : UIImage?
    
    init(title : String , subtitle : String , activityType : ActivityType , photo : UIImage? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subTitle = subtitle
        self.activityType = activityType
        self.photo = photo
    }
    
    
    
    
}
