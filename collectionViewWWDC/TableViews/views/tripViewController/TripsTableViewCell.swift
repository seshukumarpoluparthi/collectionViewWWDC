//
//  TripsTableViewCell.swift
//  collectionViewWWDC
//
//  Created by apple on 12/7/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      cardView.addShadowandRoundCorners()
    }
    func setup(tripmodel : TripModel)  {
        titleLabel.text = tripmodel.title
        
    }
    
    
    
    
    
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
