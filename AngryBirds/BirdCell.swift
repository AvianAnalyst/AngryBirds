//
//  BirdCell.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 3/24/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation
import UIKit

class BirdCell: UITableViewCell {
    var bird: Bird! {
        didSet {
            resetView()
        }
    }
    
    func resetView() {
        self.birdTypeLabel.text = self.bird.name
        self.birdDescriptionLabel.text = "He angry"
        
        if let imageURL = URL(string: self.bird.imageUrl) {
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData: NSData = NSData(contentsOf: imageURL)!

                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    self.birdImageView.image = image
                }
            }
        }
        
        if self.bird.confirmedAngry {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }

    }
    
    @IBOutlet weak var birdImageView: UIImageView! {
        didSet {
            birdImageView.layer.cornerRadius = birdImageView.bounds.width / 2
            birdImageView.clipsToBounds = true
        }
    }

    @IBOutlet weak var birdTypeLabel: UILabel!
    @IBOutlet weak var birdDescriptionLabel: UILabel!
}
