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
        
        cell.birdTypeLabel.text = self.birds[indexPath.row].name
        cell.birdDescriptionLabel.text = "He angry"
        
        if let imageURL = URL(string: self.birds[indexPath.row].imageUrl) {
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData: NSData = NSData(contentsOf: imageURL)!

                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    cell.birdImageView.image = image
                }
            }
        }
        
        return cell
    }
    
    //MARK: Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = UIAlertController(title: nil, message: "HALLO", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        menu.addAction(cancelAction)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call \(indexPath.row)", style: .default, handler: callActionHandler)
        menu.addAction(callAction)
        
        let checkInAction = UIAlertAction(title: "Check In", style: .default, handler:
        {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        }
        )
        menu.addAction(checkInAction)
        
        present(menu, animated: true, completion: nil)
    }
    
    
    
    

}




