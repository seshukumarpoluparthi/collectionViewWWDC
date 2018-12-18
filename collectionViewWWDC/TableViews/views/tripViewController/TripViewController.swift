//
//  TripViewController.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        TripFunctions.readTrips(completion: { [weak self] in
            self?.tableView.reloadData()
        })
        view.backgroundColor = Theme.background
        addButton.createFloatingActionButton()

        view.bringSubviewToFront(addButton)
       
    }
    
    
    @IBAction func unwindTotripViewController(_ unwindSegue: UIStoryboardSegue) {}
  
    
    
    
    
}
extension TripViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data1.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
//        if cell == nil{
//           cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
        
//        cell!.textLabel?.text = Data1.tripModels[indexPath.row].title
        
        cell.setup(tripmodel: Data1.tripModels[indexPath.row])
        
        return cell
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stbd = UIStoryboard(name: "Main", bundle: nil)
         let vc = stbd.instantiateViewController(withIdentifier: "ActivitiesViewController") as! ActivitiesViewController
         self.present(vc, animated: true, completion: nil)
            
            
            
    }
    
    
    
    
}

extension TripViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data1.tripModels[indexPath.row]
        
        
        
        
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed : @escaping (Bool) -> ()) in
            let alert = UIAlertController(title: "Delete Trip", message: "are u sure you want to delete this trip \(trip.title)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            self.present(alert, animated: true, completion: nil)
            
            
            
           // perform delete
//            TripFunctions.deleteTrip(index: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            actionPerformed(true)
//            tableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [delete])
        
        
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (UIContextualAction, view, actionperformed : (Bool) -> ()) in
            
            // perform action
            
            
        }
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    
    
    
    
    
}
