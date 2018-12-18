//
//  StructVC2.swift
//  collectionViewWWDC
//
//  Created by apple on 12/18/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class StructVC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let email = UserDefaults.standard.value(forKey: "email")
        print(email ?? "")
      let data = UserDefaults.standard.value(forKey: "userInfo")
        do{
            let res = try JSONDecoder().decode(Welcome.self, from:data as! Data)
        print(res)
        }catch{
            print(error.localizedDescription)
        }
    }
}
