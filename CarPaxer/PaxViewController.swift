//
//  PaxViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class PaxViewController: UIViewController {

    var db : Database?
    
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var displayAvailable: UILabel!
    
    var driverno: Int = 0;
    
    var driverName: String = "Empty"
    var availableSeats: String = "0"
    
    @IBAction func paxButton(sender: UIButton) {
        db?.carArray[driverno].availableSeats -= 1
        db?.carArray[driverno].listOfUsers.append(UserInfo(name: "Anton"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDriver()
        
        displayName.text = db?.carArray[driverno].carOwner
        displayAvailable.text = String((db?.carArray[driverno].availableSeats)!)
        
    }

    func loadDriver() {
    
        print(db?.carArray)
        for (var i = 0; i < db?.carArray.count; i += 1) {
            if (db?.carArray[i].carOwner == displayName.text) {
                driverno = i
                print(driverno)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toLobbyView2") {
            let lobbyViewController = segue.destinationViewController as! LobbyViewController
            
            lobbyViewController.newHangoutName = driverName
            print("driverName: \(driverName)")
            lobbyViewController.availableSeatsLeftInt = (db?.carArray[driverno].availableSeats)!
            
            //db = Database()
            //print(db?.userArray.last!.name)
            //driverViewController.newName = nameField.text!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
