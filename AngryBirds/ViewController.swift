//
//  ViewController.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 3/23/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
        cell.birdLabel.text = self.birds[indexPath.row].name
        
        if let imageURL = URL(string: self.birds[indexPath.row].imageUrl) {
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData: NSData = NSData(contentsOf: imageURL)!

                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    cell.birdImage.image = image
                }
            }
        }
        
        return cell
    }

}




