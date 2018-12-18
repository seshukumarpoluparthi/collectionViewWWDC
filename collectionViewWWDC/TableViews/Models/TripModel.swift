//
//  TripModel.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit

class TripModel {
    
    var id : UUID
    var title : String
    var image : UIImage?
    var dayModels = [DayModel]()
    init(title : String , image : UIImage? = nil , dayModels : [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels{
            self.dayModels = dayModels
        }
        
        
        
    }
    
    
    
    
}
