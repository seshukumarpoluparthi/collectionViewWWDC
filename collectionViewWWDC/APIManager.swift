//
//  APIManager.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit



class ApiManager {
    static let Shared = ApiManager()
    private init(){}
    
    func PostCodable(url:String,jsonbody:Data,completion : @escaping (_ response : Data) -> Void) {
        print(url)
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonbody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let urlContent = data {
                completion(urlContent)
            } else {
                print("ERROR FOUND HERE")
                return
            }
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
        }
        task.resume()
    }
    
    
}



