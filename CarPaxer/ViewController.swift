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
    
    var db : Database? = Database()
    //userButton.enabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverButton.enabled = false
        userButton.enabled = false
        print(db?.carArray)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editingTextField(sender: UITextField) {
        if nameField.text != ""{
            driverButton.enabled = true
            userButton.enabled = true
        }//else{
           // driverButton.enabled = false
            //userButton.enabled = false
        //}
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDriverView" {
            let driverViewController = segue.destinationViewController as! DriverViewController
            let newUser = UserInfo(name: nameField.text!)
            //db = Database()
            db?.userArray.append(newUser)
            print(db?.userArray.last!.name)
            //driverViewController.newName = nameField.text!
            driverViewController.db = db
        }
        
        if segue.identifier == "toUsersView" {
            let userViewController = segue.destinationViewController as! DriversTableViewController
            let newUser = UserInfo(name: nameField.text!)
            db?.userArray.append(newUser)
            print("LOLOLOL")
            //driverViewController.newName = nameField.text!
            userViewController.db = db
        }
        
    }

}

