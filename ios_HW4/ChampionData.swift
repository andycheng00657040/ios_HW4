//
//  ChampionData.swift
//  ios_HW4
//
//  Created by User08 on 2020/5/19.
//  Copyright © 2020 00657012. All rights reserved.
//

import Foundation

class ChampionData: ObservableObject {
    
    @Published var champions = [Champion]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(champions) {
                UserDefaults.standard.set(data, forKey: "champions")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "champions") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Champion].self, from: data) {
                champions = decodedData
            }
        }
    }
    
}
