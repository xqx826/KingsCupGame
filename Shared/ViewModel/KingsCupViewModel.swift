//
//  KingsCupViewModel.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import Foundation

public class KingsCupViewModel: ObservableObject {
    private let num_players: Int
    @Published var model: KingsCupGame
    @Published var num_k: Int = 0
    var curr_card: Card? {model.curr_card}
    var curr_player: Int {model.curr_player}
    var players: [Player]? {model.players}
    var deck: Deck {model.deck}
    
    public init(num_players: Int, names:[String]) {
        self.num_players = num_players
        var temp_players: [Player] = []
        for i in 0..<num_players {
            let player = Player(id: i, name: names[i])
            if i == 0 {
                player.isPlaying = true
            }
            temp_players.append(player)
        }
        self.model = KingsCupViewModel.createGame(players: temp_players)
    }
    
    static func createGame(players: [Player]) -> KingsCupGame {
        return KingsCupGame(players: players)
    }
    
    func discard_card() {
        model.discard_card()
    }
    
    func next_round() {
        if curr_player < num_players - 1 {
            model.curr_player += 1
        } else {
            model.curr_player = 0
        }
        var temp_players: [Player] = []
        for i in 0..<num_players {
            let player = Player(id: players![i].id, name: players![i].name)
            player.has_two = players![i].has_two
            player.num_of_eight = players![i].num_of_eight
            if i == curr_player {
                player.isPlaying = true
            }
            temp_players.append(player)
        }
        model.players = temp_players
    }
    
    func flip() {
        guard let card = model.deck.get_card() else {
            print("ERROR: NO CARD LEFT")
            return
        }
        if card.isFacingUp == true {
            discard_card()
            if deck.get_length() == 0 {
                create_new_deck()
            }
            model.curr_card = deck.get_card()
            self.model = model
            next_round()
            return
        } else {
            card.isFacingUp = true
            model.curr_card = Card(id: card.id, rank: card.rank, suit: card.suit)
            model.curr_card?.isFacingUp = true
            print("card chosen: \(card.suit) \(card.rank)")
            print("current player \(model.curr_player)")
        }
        
        if card.rank == Rank.two {
            for i in 0 ..< num_players {
                model.players[i].has_two = false
            }
            model.players[model.curr_player].has_two = true
        }
        if card.rank == Rank.eight {
            model.players[model.curr_player].num_of_eight += 1
        }
        if card.rank == Rank.king {
            self.num_k += 1
            if self.num_k == 4 {
                print("LAST K!!!")
            }
        }
        self.model = model
    }
    
    func use_eight(playerID: Int) {
        if self.model.players[playerID].num_of_eight > 0 {
            self.model.players[playerID].num_of_eight -= 1
            self.model = model
        }
    }
    
    func create_new_deck() {
        var num_eight_present = 0
        for i in 0 ..< num_players {
            num_eight_present += model.players[i].num_of_eight
        }
        model.deck = Deck(without: num_eight_present)
    }
    
    func clear_num_k() {
        self.num_k = 0
    }
}
