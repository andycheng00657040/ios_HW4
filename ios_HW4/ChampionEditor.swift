//
//  ChampionEditor.swift
//  ios_HW4
//
//  Created by User08 on 2020/5/19.
//  Copyright © 2020 00657012. All rights reserved.
//

import SwiftUI

struct ChampionEditor: View {
    @Environment(\.presentationMode) var presentationMode
        var championData: ChampionData
        var varietys = ["上路", "中路", "ad", "打野", "輔助"]
        @State private var Mark = true
        @State private var ChampionName = ""
        @State private var Variety = "上路"
        @State private var Result = true
        @State private var Time = Date()
        @State private var Kill = ""
        @State private var Death = ""
        @State private var Assist = ""
        let dateFormatter: DateFormatter = {
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .medium
           dateFormatter.timeStyle = .medium
           return dateFormatter
        }()
        var editChampion: Champion?
        
        var body: some View {
            Form {
                
                TextField("英雄名稱 or 綽號 ",text: $ChampionName)

                .font(.largeTitle)
                .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.black, lineWidth: 2))
                .frame(width: 380, height: 50)
                .multilineTextAlignment(.center)
                Toggle("專七了ㄇ", isOn: $Mark)
                Picker(selection: $Variety, label: Text("這場走哪")) {
                  ForEach(varietys, id: \.self) { (Variety) in
                      Text(Variety)
                   }
                }
                .frame(width: 300, height: 50)
                .cornerRadius(30)
                .shadow(radius: 30)
                .clipped()
                Toggle("勝負", isOn: $Result)
                TextField("幾殺",text: $Kill)
                TextField("幾死",text: $Death)
                TextField("幾助攻",text: $Assist)
                VStack {
                   DatePicker("記錄一下什麼時候玩的吧～", selection: $Time, displayedComponents: .date)
                }
                
            }
            .navigationBarTitle( "聯盟紀錄")
            .navigationBarItems(trailing: Button("Save") {
                let champion = Champion(Mark: self.Mark, Result: self.Result, ChampionName: self.ChampionName,  Variety: self.Variety, Time: self.Time, Kill: self.Kill, Death: self.Death, Assist: self.Assist)
                if let editChampion = self.editChampion {
                    let index = self.championData.champions.firstIndex {
                        $0.id == editChampion.id
                        }!
                    self.championData.champions[index] = champion
                } else {
                    self.championData.champions.insert(champion, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
                
            })
            .onAppear {
                if let editChampion = self.editChampion {
                    self.Mark = editChampion.Mark
                    self.ChampionName = editChampion.ChampionName
                    self.Variety = editChampion.Variety
                    self.Result = editChampion.Result
                    self.Time = editChampion.Time
                    self.Kill = editChampion.Kill
                    self.Death = editChampion.Death
                    self.Assist = editChampion.Assist
                }
            }
        }
    }

    struct ChampionEditor_Previews: PreviewProvider {
        static var previews: some View {
            ChampionEditor(championData: ChampionData())
        }
    }
