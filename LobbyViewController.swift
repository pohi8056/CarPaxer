//
//  LobbyViewController.swift
//  CarPaxer
//
//  Created by Anton Källbom on 05/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBOutlet weak var hangoutName: UILabel!
    @IBOutlet weak var availableSeatsLeftText: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var newHangoutName : String = ""
    var availableSeatsLeftInt = 0
    var users = [UserInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hangoutName.text = newHangoutName
        availableSeatsLeftText.text = "Available seats left: \(availableSeatsLeftInt)"
        
        loadPassengers()
        setProgress()
    }
    
    func setProgress() {
        progressBar.progress = Float(availableSeatsLeftInt) / 7.0
    }
    
    func loadPassengers() {
        //let user1 = UserInfo(name: "Pontahontas", hasCar: false, car: CarInfo(carOwner: "Gustav", availableSeats: 4))
        //let user2 = UserInfo(name: "Antevante", hasCar: false, car: CarInfo(carOwner: "Gustav", availableSeats: 4))
        
        //users += [user1, user2]
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
