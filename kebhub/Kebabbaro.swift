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
    var positive: Int
    var negative: Int
    
    init(name: String, imageName: String, address: String, positive: Int, negative: Int) {
        self.name = name
        self.imageName = imageName
        self.address = address
        self.positive = positive
        self.negative = negative
    }
}
