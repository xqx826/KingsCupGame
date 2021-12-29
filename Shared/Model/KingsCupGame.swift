//
//  KingsCupGame.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import Foundation

public class KingsCupGame {
    public var deck = Deck()
    public var players: [Player]
    public var curr_player: Int = 0
    public var num_k: Int = 0
    public var curr_card: Card?
    
    public init(players: [Player]) {
        self.players = players
        self.curr_card = deck.cards.last
    }
    
    public func flip_card() {
        guard let card = deck.get_card() else {
            print("no card left to be flipped")
            return
        }
        
        if card.isFacingUp == true {
            discard_card()
            if deck.get_length() == 0 {
                self.deck = Deck()
                print("NEW DECK OF CARDS")
            }
            // TODO: check if deck has no more card after the current one is discarded
            update_curr_card(newCard: deck.get_card()!)
            next_round()
            return
        } else {
            card.isFacingUp = true
            print("card chosen: \(card.suit) \(card.rank)")
            print("current player \(curr_player)")
            let newCard = Card(id: card.id, rank: card.rank, suit: card.suit)
            newCard.isFacingUp = true
            update_curr_card(newCard: newCard)
        }
        
        if card.rank == Rank.two {
            let newPlayer = Player(name: players[curr_player].name)
            newPlayer.has_two = true
            update_has_two(playerID: curr_player, newPlayer: newPlayer)
        }
        
        if card.rank == Rank.eight {
            let newPlayer = Player(name: players[curr_player].name)
            newPlayer.num_of_eight = players[curr_player].num_of_eight + 1
            update_num_eight(playerID: curr_player, newPlayer: newPlayer)
        }
        
        if card.rank == Rank.king {
            num_k += 1
            if num_k == 4 {
                print("Last Person draws K!!")
            }
        }
    }
    
    public func discard_card() {
        self.deck.discard_card()
    }
    
    public func update_curr_card(newCard: Card) {
        self.curr_card = newCard
    }
    

    public func update_num_eight(playerID: Int, newPlayer: Player) {
        var temp_players: [Player] = []
        // when updating player to indicate new owner of 2, we want to make all previous owners' has_two = false
        // when updating player with number of eight, we want to keep all the previously stored data
        for i in 0 ..< players.count {
            let player = Player(name: players[i].name)
            player.has_two = players[i].has_two
            player.num_of_eight = players[i].num_of_eight
            temp_players.append(player)
        }
        temp_players[playerID] = newPlayer
        self.players = temp_players
    }
    
    public func update_has_two(playerID: Int, newPlayer: Player) {
        var temp_players: [Player] = []
        // when updating player to indicate new owner of 2, we want to make all previous owners' has_two = false
        // when updating player with number of eight, we want to keep all the previously stored data
        for i in 0 ..< players.count {
            let player = Player(name: players[i].name)
            player.num_of_eight = players[i].num_of_eight
            temp_players.append(player)
        }
        temp_players[playerID] = newPlayer
        self.players = temp_players
    }
    
    public func next_round() {
        let num_players = players.count
        if curr_player < num_players - 1 {
            curr_player += 1
        } else {
            curr_player = 0
        }
        
        var temp_players: [Player] = []
        for i in 0..<num_players {
            let player = Player(name: players[i].name)
            player.has_two = players[i].has_two
            player.num_of_eight = players[i].num_of_eight
            if i == curr_player {
                player.isPlaying = true
            }
            temp_players.append(player)
        }
        self.players = temp_players
    }
}

