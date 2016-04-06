//
//  DriversTableViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class DriversTableViewController: UITableViewController {

    var drivers = [CarInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadDrivers()
    }
    
    func loadDrivers(driver: CarInfo) {
        //let driver1 = CarInfo(carOwner: "Gustavs sportbil", availableSeats: 4)
        //let driver2 = CarInfo(carOwner: "Antons racerbuss", availableSeats: 7)
        
        drivers += [driver]
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
        return drivers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "DriversTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DriversTableViewCell
        
        
        let driver = drivers[indexPath.row]

        cell.driverName.text = driver.carOwner
        cell.availableSeats.text = String(driver.availableSeats)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toPaxView") {
            let viewController = segue.destinationViewController as! PaxViewController
            
            let path = self.tableView.indexPathForSelectedRow!
            let driver = drivers[path.row]
            viewController.driverName = driver.carOwner
            viewController.availableSeats = String(driver.availableSeats)
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
