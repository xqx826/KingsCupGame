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
            for player in players {
                player.has_two = false
            }
            players[curr_player].has_two = true
        }
        
        if card.rank == Rank.eight {
            players[curr_player].num_of_eight += 1
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
            if i == curr_player {
                player.isPlaying = true
            }
            temp_players.append(player)
        }
        self.players = temp_players
    }
}

