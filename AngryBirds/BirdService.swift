//
//  BirdService.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 3/24/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation

class Bird {
    var name: String
    var imageUrl: String
    var confirmedAngry = false
    
    init(name: String = "No Name", imageUrl: String = "https://vignette.wikia.nocookie.net/angrybirdsfanon/images/f/fc/Killer_Cut_Bird.png") {
        self.name = name
        self.imageUrl = imageUrl
    }
}

class BirdService {
    func getBirds() -> [Bird] {
        return [
          Bird(
            name: "Bluebird",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/bluebird.png"
          ),
          Bird(
            name: "European Sparrow",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/otherEuropeanSparrow.png"
          ),
          Bird(
            name: "European Sparrow",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/europeanSparrow.png"
          ),
          Bird(
            name: "Amazon",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/greenParrot.png"
          ),
          Bird(
            name: "Bald Eagle",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/baldEagle.png"
          ),
          Bird(
            name: "Willie Wagtail",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/willieWagtail.png"
          ),
          Bird(
            name: "Hawk",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/hawk.png"
          ),
          Bird(
            name: "Whatever This Thing Is",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/whateverThisIs.png"
          ),
          Bird(
            name: "Blackneck Bluebird",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/blackNeckBlueBird.png"
          ),
          Bird(
            name: "A...Finch?",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/someKindOfFinch.png"
          ),
          Bird(
            name: "Cardinal-Seagull Cross?",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/cardinal.png"
          ),
          Bird(
            name: "White Parrots Fighting",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/whiteParrots.png"
          ),
          Bird(
            name: "Hummingbird",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/hummingbird.png"
          ),
          Bird(
            name: "Oriole",
            imageUrl: "https://chelseatroy.com/wp-content/uploads/2019/05/oriole.png"
            )
        ]
    }
}
