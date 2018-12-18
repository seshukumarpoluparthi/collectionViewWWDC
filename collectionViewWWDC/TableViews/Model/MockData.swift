//
//  MockData.swift
//  collectionViewWWDC
//
//  Created by apple on 12/9/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit


struct createMockActivity_ModelData {
    var sectionTitle : String
}




class MockData {
    
    static func createMockTripModelData() -> [TripModel]{
        var mockTrips = [TripModel]()
        mockTrips.append(TripModel(title: "Trip to vizag", image: nil, dayModels: createmockDayModelData()))
    return mockTrips
    
    }
    
    static func createmockDayModelData() -> [DayModel]{
        var dayModels = [DayModel]()
        dayModels.append(DayModel(title: "apr 18", subtitle: "creat", data:nil))
      return dayModels
    }
}
