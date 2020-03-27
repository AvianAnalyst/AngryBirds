//
//  ViewController.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 3/23/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class AngryBirdListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var birdService: BirdService?
    var birds: [Bird] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.birdService = BirdService()
        self.birds = birdService?.getBirds() ?? []
    }
    
    //MARK: DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.birds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "dataCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! BirdCell
        
        cell.bird = self.birds[indexPath.row]
                
        return cell
    }
    
    //MARK: Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! BirdCell
        let menu = UIAlertController(title: nil, message: "Bird Interaction Options", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        menu.addAction(cancelAction)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Time to yell at the bird", message: "Ready?", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "AHHHHHHHHHHHHHH", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Yell At Bird", style: .default, handler: callActionHandler)
        menu.addAction(callAction)
        
        let toggleAngerTitle = cell.bird.confirmedAngry ? "Remove Anger Confirmation" : "Confirm Angry"
        let toggleAngerConfirmation = UIAlertAction(title: toggleAngerTitle, style: .default, handler:
        {
            (action:UIAlertAction!) -> Void in
            
            cell.bird.confirmedAngry = !cell.bird.confirmedAngry
            cell.accessoryType = cell.bird.confirmedAngry ? .checkmark : .none
        })
        menu.addAction(toggleAngerConfirmation)
        
        present(menu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    
    

}




