//
//  PassengerTableViewCell.swift
//  CarPaxer
//
//  Created by Anton Källbom on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class PassengerTableViewCell: UITableViewCell {

    @IBOutlet weak var passengerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
