//
//  TripFunctions.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit
class TripFunctions {
    
    static func createTrip(tripModel : TripModel){
        Data1.tripModels.append(tripModel)
        
    }
    static func readTrips(completion : @escaping () -> () ){
    
        DispatchQueue.global(qos: .userInteractive).async {
            if Data1.tripModels.count == 0{
                Data1.tripModels = MockData.createMockTripModelData()
//                Data1.tripModels.append(TripModel(title: "Trip to Vizag"))
//                Data1.tripModels.append(TripModel(title: "Trip to hyd"))
//                Data1.tripModels.append(TripModel(title: "Trip to channai"))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
        
      
    }
    static func updateTrip(at index : Int , title : String , image:UIImage? = nil){
        Data1.tripModels[index].title = title
        
        
    }
    
    
    static func deleteTrip(index : Int){
        Data1.tripModels.remove(at: index)
        
    }
}
