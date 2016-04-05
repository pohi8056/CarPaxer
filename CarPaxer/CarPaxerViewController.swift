//
//  CarPaxerViewController.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 05/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class CarPaxerViewController: UIViewController {

    var paxbool = false
    
    @IBAction func paxbutton(sender: UIButton) {
        paxbool = true
    }

    @IBAction func carfull(sender: UIButton) {
        paxbool = false
    }
    
    
}
