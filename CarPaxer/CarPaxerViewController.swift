//
//  CarPaxerViewController.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 05/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class CarPaxerViewController: UIViewController {

    var pax = false
    
    @IBAction func paxbutton(sender: UIButton) {
        pax = true
    }

    @IBAction func carfull(sender: UIButton) {
        pax = false
    }
    
}
