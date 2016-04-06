//
//  PaxViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class PaxViewController: UIViewController {

    
    @IBOutlet weak var msg: UILabel!
   
    
    var driverName: String = "dfgdfg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        msg.text = driverName
        // Do any additional setup after loading the view.
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
