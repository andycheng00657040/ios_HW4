//
//  Champion.swift
//  ios_HW4
//
//  Created by User08 on 2020/5/19.
//  Copyright © 2020 00657012. All rights reserved.
//

import Foundation

struct Champion: Identifiable, Codable {
    var id = UUID()
    var Mark: Bool
    var Result: Bool
    var ChampionName: String
    var Variety: String
    var Time: Date
    var Kill: String
    var Death: String
    var Assist: String
}
