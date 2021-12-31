//
//  PlayerConfigView.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-30.
//

import SwiftUI

struct PlayerConfigView: View {
    @ObservedObject var viewModel: PlayerConfigViewModel
    @State private var num_of_players = 2
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Number of Players", selection: $num_of_players) {
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                        Text("6").tag(6)
                        Text("7").tag(7)
                        Text("8").tag(8)
                    }
                    .onAppear {
                        viewModel.update_num_players(players_count: num_of_players)
                    }
                }
                Section {
                    ForEach(0 ..< num_of_players, id: \.self) { index in
                        PlayerNameTextField(viewModel: viewModel, playerID: index)
                    }
                }
                if viewModel.isCompleted {
                    // Text("COMPLETEDDDDD")
                    NavigationLink(destination: ContentView(gameViewModel: KingsCupViewModel(num_players: viewModel.num_players))) {
                        Text("Start Game")
                    }
                }
            }
            
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}
 
struct PlayerNameTextField: View {
    @ObservedObject var viewModel: PlayerConfigViewModel
    var playerID: Int
    @State private var name = ""
    
    var body: some View {
        TextField("Player \(playerID) name", text: $name)
            .onSubmit {
                viewModel.update_name(playerID: playerID, name: name)
            }
    }
}

struct PlayerConfigView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerConfigView(viewModel: PlayerConfigViewModel())
    }
}
