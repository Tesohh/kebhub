//
//  Kebabbaro.swift
//  kebhub
//
//  Created by Simone Tesini on 24/10/23.
//

import Foundation
import SwiftData


@Model
class Kebabbaro {
    var name: String
    var imageName: String
    var address: String
    var points: Int
    var wheelChairAccessible: Bool
    var petFriendly: Bool
    
    init(name: String, imageName: String, address: String, points: Int, wheelChair: Bool = false, petFriendly: Bool = false) {
        self.name = name
        self.imageName = imageName
        self.address = address
        self.points = points
        self.wheelChairAccessible = wheelChair
        self.petFriendly = petFriendly
    }
}

extension Kebabbaro {
    static var sampleData: [Kebabbaro] = [
        Kebabbaro(
            name: "Matteotti Turkish",
            imageName: "matteottikebab",
            address: "Piazza Giacomo Matteotti, Bolzano, Italia",
            points: 100
        ),
        Kebabbaro(
            name: "Skampini",
            imageName: "skampini",
            address: "Piazza Domenicani 41, Bolzano, Italia",
            points: 10
        ),
        Kebabbaro(
            name: "New Kurdistan",
            imageName: "kurdistan",
            address: "Corso Italia, 5, Bolzano, Italia",
            points: 0
        ),
    ]
}
