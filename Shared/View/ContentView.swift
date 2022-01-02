//
//  ContentView.swift
//  Shared
//
//  Created by Sherry Xu on 2021-12-27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameViewModel: KingsCupViewModel
    var body: some View {
        VStack {
        PlayerListView(viewModel: gameViewModel)
                .padding(.top)
                .padding(.leading)
        Spacer()
        CardView(card: gameViewModel.curr_card!)
            .onTapGesture {
                gameViewModel.flip()
            }
            .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameViewModel: KingsCupViewModel(num_players: 4, names: ["1", "2", "3", "4"]))
    }
}
