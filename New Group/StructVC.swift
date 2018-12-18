//
//  StructVC.swift
//  collectionViewWWDC
//
//  Created by apple on 12/18/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

struct Welcome: Codable {
    let loginType, email, role, lastname: String
    let v: Int
    let createdTime: String
    let active, isverify: Int
    let firstname, password, id, updatedTime: String
    var logintype : String?
    enum CodingKeys: String, CodingKey {
        case loginType, email, role, lastname,logintype
        case v = "__v"
        case createdTime = "CreatedTime"
        case active, isverify, firstname, password
        case id = "_id"
        case updatedTime = "UpdatedTime"
    }
}

class StructVC: UIViewController {
   
    let userInfoDict:[String:Any] = ["CreatedTime": "2018-12-11T11:27:49.714Z", "lastname": "poluparthi", "UpdatedTime": "2018-12-11T11:27:49.714Z", "_id": "5c0f9f358872b420d5e4a663", "email": "seshuavesh+1@gmail.com", "loginType": "email", "firstname": "seshu", "password": "12345678", "__v": 0, "active": 1, "role": "STUDENT", "isverify": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // converting dictionary into struct
        let jsonData = try? JSONSerialization.data(withJSONObject: userInfoDict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString!)
        do{
            var decode = try JSONDecoder().decode(Welcome.self, from: jsonData!)
            // adding key and value
            decode.logintype = "email"
            UserDefaults.standard.set(decode.email, forKey: "email")
            // store struct data into userdefaults
            do{
                let data = try JSONEncoder().encode(decode)
                UserDefaults.standard.set(data, forKey: "userInfo")
            }
            print(decode)
        } catch{
            print(error.localizedDescription)
        }
    }
}
