//
//  ChampionList.swift
//  ios_HW4
//
//  Created by User08 on 2020/5/19.
//  Copyright © 2020 00657012. All rights reserved.
//

import SwiftUI

struct ChampionList: View {
    
    @ObservedObject var championData = ChampionData()
    @State private var showEditChampion = false
    
    
    var body: some View {
        NavigationView {
            List {
              ForEach(championData.champions) { (champion) in
                    NavigationLink(destination: ChampionEditor(championData: self.championData, editChampion: champion)) {
                        ChampionRow(champion: champion)

                    }
                    
                }
                .onDelete { (indexSet) in
                    self.championData.champions.remove(atOffsets: indexSet)
                }
                
            }
            .navigationBarTitle("勝敗統計")
            .navigationBarItems(leading: EditButton() , trailing: Button(action: {
                self.showEditChampion = true
            }) {
                Image(systemName: "plus.circle.fill")
            })
                .sheet(isPresented: $showEditChampion) {
                    NavigationView {
                        ChampionEditor(championData: self.championData)

                    }
            }
        }
    }
}

struct ChampionList_Previews: PreviewProvider {
    static var previews: some View {
        ChampionList()
    }
}

