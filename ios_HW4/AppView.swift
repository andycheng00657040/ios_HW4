//
//  AppView.swift
//  ios_HW4
//
//  Created by User08 on 2020/5/19.
//  Copyright © 2020 00657012. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var championData = ChampionData()
        var body: some View {
            TabView {
                ChampionList(championData: self.championData).tabItem {
                    Image(systemName: "heart")
                    Text("勝敗統計")
                }
                PieChartView(championData: self.championData).tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("分析")
                }
            }
        }
    }
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
