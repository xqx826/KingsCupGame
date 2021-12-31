//
//  PlayerConfigView.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-30.
//

import SwiftUI

struct PlayerConfigView: View {
    @State private var num_of_players = 2
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Number of Players", selection: $num_of_players) {
                        ForEach(2 ..< 10) {
                            Text("\($0-2) PPL")
                        }
                    }
                }
                Section {
                    ForEach(0 ..< num_of_players, id: \.self) { index in
                        TextField("Player \(index)'s name", text: <#T##Binding<String>#>)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
 
struct PlayerConfigView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerConfigView()
    }
}
