//
//  Post.swift
//  Reddit
//
//  Created by Pete Parks on 4/29/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import Foundation



struct PostThirdLevelObject: Codable {
    let data: Student
}

struct Student: Codable {
    let name: String
    let house: String?
    let patronus: String?
    let species: String?
    let bloodStatus: String?
    let role: String?
    let school: String?
    let deathEater: Bool?
    let dumbledoresArmy: Bool?
    let orderOfThePhoenix: Bool?
    let ministryOfMagic: Bool?
    let alias: String?
    let wand: String?
    let boggart: String?
    let animagus: String?
}
