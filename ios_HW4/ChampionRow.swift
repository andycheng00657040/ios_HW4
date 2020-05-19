//
//  ChampionRow.swift
//  ios_HW4
//
//  Created by User08 on 2020/5/19.
//  Copyright © 2020 00657012. All rights reserved.
//

import SwiftUI

struct ChampionRow: View {
    var champion: Champion
    let dateFormatter: DateFormatter =
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    var body: some View {
        HStack {
            
            Image(champion.Result ? "victory" : "defeat")
               .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width:50, height: 50)
                .clipShape(Circle())
                
            VStack (alignment: .leading) {
                Text("英雄:\(champion.ChampionName) ")
                Text("位置:\(champion.Variety)")
            }
        Text("\(champion.Kill)/\(champion.Death)/\(champion.Assist)")
            VStack (alignment: .leading) {
           
                   Text("\(dateFormatter.string(from: champion.Time))")
            }
            Image(champion.Mark ? "專精七" : "銅牌")
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30, alignment: .leading)
        }
    }
}

struct ChampionRow_Previews: PreviewProvider {
    static var previews: some View {
        ChampionRow(champion: Champion(Mark: true, Result: false, ChampionName: "yasuo", Variety: "中路", Time: Date(), Kill: "3", Death: "10", Assist: "1"))
    }
}
