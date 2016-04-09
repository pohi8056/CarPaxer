//
//  DriverViewController.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 05/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit
import Firebase


class DriverViewController: UIViewController {
    var myRootRef = Firebase(url:"https://paxapp.firebaseio.com/Cars")

    @IBOutlet weak var welcomeMsg: UILabel!
    @IBOutlet weak var numberOfSeatsText: UILabel!
    @IBOutlet weak var numberOfSeats: UISlider!
    
    
    var newName : String = "Welcome, "
    var db : Database?
    override func viewDidLoad() {
        super.viewDidLoad()
        newName = (db?.userArray.last!.name)!
        welcomeMsg.text = "Welcome, \(newName)."
        numberOfSeatsText.text = "Available seats: \(Int(numberOfSeats.value))"
        print(db?.carArray)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeValueOfSlider(sender: UISlider) {
        
        //if Int(numberOfSeats.value) == 1{
            //numberOfSeatsText.text = "Available seat: \(Int(numberOfSeats.value))"
        //}else{
            numberOfSeatsText.text = "Available seats: \(Int(numberOfSeats.value))"
        //}
    }
    
    
/*
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
  */
    
    func updateCarInfo(){
        let newCar = CarInfo(carOwner: newName, availableSeats: Int(numberOfSeats.value))
        newCar.remainingSeats = Int(numberOfSeats.value)
        db?.carArray.append(newCar)

    }
    
    func toFirebase(){
        let fnewCar = OnlineBase(key: (db?.carArray.last!.carOwner)!, carName: (db?.carArray.last!.carOwner)!, availableSeats: (db?.carArray.last!.availableSeats)!)
        let fnewCarRef = myRootRef.childByAppendingPath(newName)
        fnewCarRef.setValue(fnewCar.toAnyObject())

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toLobbyView" {
            let lobbyViewController = segue.destinationViewController as! LobbyViewController
            lobbyViewController.newHangoutName = newName
            lobbyViewController.availableSeatsLeftInt = Int(numberOfSeats.value)
            lobbyViewController.db = db
            updateCarInfo()
            toFirebase()
            
        }
    }

}
