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
    var myRootRef = Firebase(url:"https://paxapp.firebaseio.com/")

    @IBOutlet weak var welcomeMsg: UILabel!
    @IBOutlet weak var numberOfSeatsText: UILabel!
    @IBOutlet weak var numberOfSeats: UISlider!
    
    
    var newName : String = "Welcome, "
    var db : Database?
    override func viewDidLoad() {
        super.viewDidLoad()
        newName = (db?.userArray.last!.name)!
        welcomeMsg.text = "Welcome, \(newName)"
        numberOfSeatsText.text = "I have \(Int(numberOfSeats.value)) available seats in my car."
        print(db?.carArray)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeValueOfSlider(sender: UISlider) {
        
        if Int(numberOfSeats.value) == 1{
            numberOfSeatsText.text = "I have \(Int(numberOfSeats.value)) available seat in my car."
        }else{
            numberOfSeatsText.text = "I have \(Int(numberOfSeats.value)) available seats in my car."
        }
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
        myRootRef.setValue(newName)

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toLobbyView" {
            let lobbyViewController = segue.destinationViewController as! LobbyViewController
            lobbyViewController.newHangoutName = newName
            lobbyViewController.availableSeatsLeftInt = Int(numberOfSeats.value)

            updateCarInfo()
            
        }
    }

}
