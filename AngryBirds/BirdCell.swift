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
    @IBOutlet weak var birdImageView: UIImageView! {
        didSet {
            birdImageView.layer.cornerRadius = birdImageView.bounds.width / 2
            birdImageView.clipsToBounds = true
        }
    }

    @IBOutlet weak var birdTypeLabel: UILabel!
    @IBOutlet weak var birdDescriptionLabel: UILabel!
}
