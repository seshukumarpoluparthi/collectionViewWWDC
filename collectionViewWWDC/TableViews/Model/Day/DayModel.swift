//
//  DayModel.swift
//  collectionViewWWDC
//
//  Created by apple on 12/9/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit

struct DayModel {
    var id : String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    init(title : String , subtitle : String , data : [ActivityModel]?) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        if let data = data {
            self.activityModels = data
        }
    }
}
