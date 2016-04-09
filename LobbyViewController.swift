//
//  LobbyViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 05/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit
import Firebase

class LobbyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var myRootRef = Firebase(url:"https://paxapp.firebaseio.com/Cars");

    var db : Database?
    var fdrivers = [OnlineBase]()
    var passengerList = [String]()
    let textCellIdentifier = "TextCell"
    
    @IBOutlet weak var hangoutName: UILabel!
    @IBOutlet weak var availableSeatsLeftText: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet var passengerTable: UITableView!
    
    
    var newHangoutName : String = ""
    var availableSeatsLeftInt = 0
    var users = [UserInfo]()
    
    var driverName: String = ""
    var driverno: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValues()
        
        hangoutName.text = newHangoutName
        
        loadDriver()
        setProgress()
        //availableSeatsLeftInt = fdrivers[driverno].availableSeats
        
        availableSeatsLeftText.text = "Available seats left: \(availableSeatsLeftInt)"

        passengerTable.delegate = self
        passengerTable.dataSource = self
        
        loadPassengers()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateValues()

    }
    
    
    func updateValues(){
        myRootRef.observeEventType(.Value, withBlock: { snapshot in
            var ftmpDrivers = [OnlineBase]()
            
            for car in snapshot.children{
                let fnewCarItem = OnlineBase(snapshot: car as! FDataSnapshot)
                //let tmpInfo = fnewCarItem.returnCarInfo()
                ftmpDrivers.append(fnewCarItem)
                //self.db?.carArray.append(tmpInfo)
            }
            self.fdrivers = ftmpDrivers
            //self.tableView.reloadData()
        })
    }
    
    func loadDriver() {
        
        print(db?.carArray)
        for (var i = 0; i < db?.carArray.count; i += 1) {
            if (db?.carArray[i].carOwner == newHangoutName) {
                print("newHangoutName: \(newHangoutName)")
                driverno = i
                print("driverno: \(driverno)")
            }
        }
    }
    
    func loadPassengers() {
        for (var i = 0; i < db?.carArray[driverno].listOfUsers.count; i += 1) {
            passengerList.append((db?.carArray[driverno].listOfUsers[i].name)!)
            //print((db?.carArray[driverno].listOfUsers[i].name)!)
        }
        
    }
    
    func setProgress() {
        progressBar.progress = Float(availableSeatsLeftInt) / 7.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passengerList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = passengerList[row]
        
        return cell
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
