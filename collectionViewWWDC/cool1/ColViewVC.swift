//
//  ColViewVC.swift
//  collectionViewWWDC
//
//  Created by apple on 12/6/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import MessageUI

struct Post_Method : Codable {
    let Method : String
    let Data : String?
    let PRCID : String
}

struct carts {
    let products : product_obj
    var orderCount : Int
}
// adding property
struct product_obj1 : Codable {
    var _id : String
    var orderCount : Int
}


class ColViewVC: UIViewController {
    @IBOutlet weak var collectionview1: UICollectionView!
    
    var products = [product_obj](){
        didSet{
            collectionview1.reloadData()
        }
    }
    
    var cart_Obj = [carts](){
        didSet{
            collectionview1.reloadData()
        }
    }
    
    var addprop = [product_obj1]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview1.delegate = self
        collectionview1.dataSource = self
        postingParameters()
    }
    
    func postingParameters(){
        var json_body = Data()
        let new_user = Post_Method(Method: "GETALLPRODUCT", Data: "", PRCID: "Product")
        do{
            json_body = try JSONEncoder().encode(new_user)
            let jsonstring = String(data: json_body, encoding: .utf8)
            print(jsonstring!)
        } catch{
            print(error.localizedDescription)
        }
        ApiManager.Shared.PostCodable(url: "http://13.112.156.167:8500/api/manager", jsonbody: json_body) { (data) in
            //   print(data)
            DispatchQueue.main.async {
                
                do{
                    let resp = try JSONDecoder().decode(ModelProduct.self, from: data)
                    //      print(resp)
                    self.products = resp.Data
                    for i in 0..<self.products.count{
                        let car = carts(products: self.products[i], orderCount: 0)
                        self.cart_Obj.append(car)
                    }
            // insert property into struct
                    for i in 0..<self.products.count{
                        let vc = product_obj1(_id: self.products[i]._id, orderCount: 0)
                        self.addprop.append(vc)
                    }
                    print(self.addprop)
                    
                    //                let jsonstr = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    //                    print(jsonstr)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @objc func onAddCartButtonTapped(sender : UIButton){
        self.cart_Obj[sender.tag].orderCount += 1
        collectionview1.reloadData()
    }
    @objc func onAddDeleteCartButtonTapped(sender:UIButton){
        if self.cart_Obj[sender.tag].orderCount != 0 {
        self.cart_Obj[sender.tag].orderCount -= 1
        collectionview1.reloadData()
        }
        
    }
    
}
extension ColViewVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cart_Obj.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview1.dequeueReusableCell(withReuseIdentifier: "CVCell1", for: indexPath) as! CVCell1
       // cell.view_bg1.backgroundColor = UIColor.lightGray
        let url = URL(string: cart_Obj[indexPath.row].products.image)
        cell.img_product.load(url: url!)
        cell.lbl_overview.text = cart_Obj[indexPath.row].products.overview
        cell.lbl_productname.text = cart_Obj[indexPath.row].products.name
        cell.lbl_price.text = cart_Obj[indexPath.row].products.price
        cell.lbl_count.text = "\(cart_Obj[indexPath.row].orderCount)"
        cell.btn_addcartbutton.tag = indexPath.row
        cell.btn_minusbutton.tag = indexPath.row
        cell.btn_addcartbutton.addTarget(self, action: #selector(onAddCartButtonTapped(sender:)), for: .touchUpInside)
        cell.btn_minusbutton.addTarget(self, action: #selector(onAddDeleteCartButtonTapped), for: .touchUpInside)
        return cell
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
