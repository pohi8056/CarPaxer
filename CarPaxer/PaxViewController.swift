//
//  PaxViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit
import Firebase

class PaxViewController: UIViewController {

    var myRootRef = Firebase(url:"https://paxapp.firebaseio.com/Cars");

    var db : Database?
    var fdrivers = [OnlineBase]()

    //var fdrivers = [OnlineBase]()
    
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var displayAvailable: UILabel!
    
    var driverno: Int = 0;
    
    var driverName: String = "Empty"
    var availableSeats: String = "0"
    
    @IBAction func paxButton(sender: UIButton) {
        let fnewCarRef = myRootRef.childByAppendingPath(fdrivers[driverno].carName)
        let tmpAvail = fdrivers[driverno].availableSeats - 1
        fnewCarRef.updateChildValues(["availableSeats" : tmpAvail])
        //fnewCarRef.updateChildValues(["currentUsers" : tmpAvail])

        //fdrivers[driverno].availableSeats -= 1;
        db?.carArray[driverno].availableSeats -= 1
        db?.carArray[driverno].listOfUsers.append(UserInfo(name: "Anton"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayName.text = driverName
        loadDriver(displayName.text!)
        displayName.text = fdrivers[driverno].carName
        displayAvailable.text = String(fdrivers[driverno].availableSeats)
        
        //displayName.text = db?.carArray[driverno].carOwner
        //displayAvailable.text = String((db?.carArray[driverno].availableSeats)!)
        
    }
 /*
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        myRootRef.observeEventType(.Value, withBlock: { snapshot in
            var ftmpDrivers = [OnlineBase]()
            
            for car in snapshot.children{
                let fnewCarItem = OnlineBase(snapshot: car as! FDataSnapshot)
                //let tmpInfo = fnewCarItem.returnCarInfo()
                ftmpDrivers.append(fnewCarItem)
                //self.db?.carArray.append(tmpInfo)
            }
            self.fdrivers = ftmpDrivers
            //RELOAD?
            
            
        })
    }
   */
    

    func loadDriver(name: String) {
    
        print(db?.carArray)
        for (var i = 0; i < fdrivers.count; i += 1) {
            if (fdrivers[i].carName == name) {
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
            lobbyViewController.availableSeatsLeftInt = fdrivers[driverno].availableSeats
            lobbyViewController.fdrivers = fdrivers
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
