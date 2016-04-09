//
//  DriversTableViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit
import Firebase

class DriversTableViewController: UITableViewController {

    var myRootRef = Firebase(url:"https://paxapp.firebaseio.com/Cars")

    var drivers = [CarInfo]()
    var fdrivers = [OnlineBase]()
    var db : Database?
    var randString = ["Racerbil", "Sportbil", "Rallybil"]
    
    
    //var userName = "Erik"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadDrivers()
        //loadDrivers()

    }
    
    
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
            self.tableView.reloadData()
            
            
        })
    }
    
    
    func loadDrivers() {

        print(db?.carArray)
        for var i = 0; i < db?.carArray.count; i += 1{
            drivers.append((db?.carArray[i])!)
        }
        
        //let driver1 = db?.carArray.last!
        //drivers.append(driver1!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fdrivers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "DriversTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DriversTableViewCell
        
        
        let driver = fdrivers[indexPath.row]

        cell.driverName.text = "\(driver.carName)'s \(randString[Int(arc4random_uniform(3))])"
        cell.availableSeats.text = String(driver.availableSeats)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toPaxView") {
            let paxViewController = segue.destinationViewController as! PaxViewController
            
            let path = self.tableView.indexPathForSelectedRow!
            let driver = fdrivers[path.row]
            
            //driver.ref?.updateChildValues(["currentUsers" : userName])
            //paxViewController.driverName = driver.carOwner
            
            paxViewController.driverName = driver.carName
            
            //paxViewController.driverno = fdrivers.count //SDFSDFSDFSDFS
            //paxViewController.availableSeats = String(driver.availableSeats)
            
            //db = Database()
            //print(db?.userArray.last!.name)
            //driverViewController.newName = nameField.text!
            paxViewController.fdrivers = fdrivers
            //paxViewController.newUser = userName
            paxViewController.db = db
        }
    }
    
    
    /*
    func prepareForSegue(segue: UIStoryboardSegue, cellForRowAtIndexPath indexPath: NSIndexPath, sender: AnyObject?) {
        let driver = drivers[indexPath.row]
        
        if segue.identifier == "toPaxViewController" {
            let paxViewController = segue.destinationViewController as! PaxViewController
            paxViewController.driverName = driver.carOwner
        }
    }
    */
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
