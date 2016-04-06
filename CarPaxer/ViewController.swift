//
//  ViewController.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 05/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var driverButton: UIButton!
    @IBOutlet weak var userButton: UIButton!
    
    
    //userButton.enabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverButton.enabled = false
        userButton.enabled = false
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editingTextField(sender: UITextField) {
        if nameField.text != ""{
            driverButton.enabled = true
            userButton.enabled = true
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDriverView" {
            let driverViewController = segue.destinationViewController as! DriverViewController
            driverViewController.newName = nameField.text!
        }
    }

}

