//
//  ContentView.swift
//  Shared
//
//  Created by Sherry Xu on 2021-12-27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameViewModel: KingsCupViewModel
    @State private var showKAlert = false
    var body: some View {
        VStack {
            PlayerListView(viewModel: gameViewModel)
                .padding(.top)
                .padding(.leading)
            Spacer()
            CardView(card: gameViewModel.curr_card!)
                .onTapGesture {
                    gameViewModel.flip()
                    if gameViewModel.num_k == 4 {
                        showKAlert = true
                        gameViewModel.clear_num_k()
                    }
                }
                .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        .alert("This is the last K", isPresented: $showKAlert) {
            Button("Fine!!", role: .cancel) {}
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameViewModel: KingsCupViewModel(num_players: 4, names: ["1", "2", "3", "4"]))
    }
}
