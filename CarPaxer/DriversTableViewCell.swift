//
//  DriversTableViewCell.swift
//  CarPaxer
//
//  Created by Anton Källbom on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class DriversTableViewCell: UITableViewCell {

    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var availableSeats: UILabel!
    
    @IBAction func paxButton(sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
