//
//  LobbyViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 05/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBOutlet weak var hangoutName: UILabel!
    @IBOutlet weak var usersInRoom: UILabel!
    @IBOutlet weak var availableSeatsLeftText: UILabel!
    
    var newHangoutName : String = ""
    var availableSeatsLeftInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hangoutName.text = newHangoutName
        availableSeatsLeftText.text = "Available seats left: \(availableSeatsLeftInt)"
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
