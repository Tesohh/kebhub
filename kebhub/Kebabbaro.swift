//
//  Kebabbaro.swift
//  kebhub
//
//  Created by Simone Tesini on 24/10/23.
//

import Foundation
import SwiftData
import PhotosUI
import _PhotosUI_SwiftUI


@Model
class Kebabbaro {
    var name: String
    var imageName: String
    var address: String
    var points: Int
    var wheelChairAccessible: Bool
    var petFriendly: Bool
//    var data: Data?
    
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
            points: 0,
            wheelChair: true,
            petFriendly: true
        ),
        Kebabbaro(
            name: "New Kurdistan",
            imageName: "kurdistan",
            address: "Corso Italia, 5, Bolzano, Italia",
            points: 0
        ),
        Kebabbaro(
            name: "Pizza Pazza",
            imageName: "pizzapazza",
            address: "Corso Italia, 5, Bolzano, Italia",
            points: 0,
            wheelChair: true,
            petFriendly: true
        ),
        Kebabbaro(
            name: "KEBZ",
            imageName: "kebz",
            address: "Via Museo 12A",
            points: 0
        ),
        Kebabbaro(
            name: "Zagros Imbiss Kebab",
            imageName: "zagros",
            address: "Piazza Universita 7",
            points: 0,
            wheelChair: true
        ),
        Kebabbaro(
            name: "Mezopotamia",
            imageName: "mezopotamia",
            address: "Via Palermo 72",
            points: 0,
            wheelChair: true
        ),
        Kebabbaro(
            name: "Dalmazia Pizza Kebab",
            imageName: "dalmazia",
            address: "Via Dalmazia 105",
            points: 0
        ),
        Kebabbaro(
            name: "Antalya Pizza&Kebab",
            imageName: "antalya",
            address: "Via della Rena 5c",
            points: 0
        ),
        Kebabbaro(
            name: "Mair Fast Food",
            imageName: "mair",
            address: "Via Palermo 22",
            points: 0
        ),
    ]
}
