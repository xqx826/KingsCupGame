//
//  CardView.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import SwiftUI


// note: got rendered once.
struct CardView: View {
    var card: Card
    
    var body: some View {
        if card.isFacingUp {
            CardFront(card: card)
                .frame(width: 300, height: 500, alignment: .center)
                .shadow(radius: 15)
        } else {
            RoundedRectangle(cornerRadius: 50, style: .continuous)
            .fill(Color.cardBackColor)
            .frame(width: 300, height: 500, alignment: .center)
            .shadow(radius: 15)
        }
    }
    
}

struct SmallerCard: View {
    var cardRank: Rank
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .fill(Color.cardForegroundColor)
                .frame(width: 30, height: 50, alignment: .center)
                .shadow(radius: 3)
            
            Text(CardFront.getRankText(rank: cardRank))
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .foregroundColor(Color.white)
        }
    }
}



struct CardFront: View {
    var card: Card
    
    static func getSuitImageName(suit: Suit) -> String {
        switch suit {
        case .club:
            return "suit.club.fill"
        case .diamond:
            return "suit.diamond.fill"
        case .heart:
            return "suit.heart.fill"
        case .spade:
            return "suit.spade.fill"
        }
    }
    
    static func getRankText(rank: Rank) -> String {
        switch rank {
        case .ace:
            return "A"
        case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
            return String(rank.rawValue)
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50, style: .continuous)
                .fill(Color.cardForegroundColor)
                .frame(width: 300, height: 500, alignment: .center)
            VStack {
                HStack{
                    Image(systemName: CardFront.getSuitImageName(suit: card.suit))
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                    Spacer()
                }
                
                Spacer()
                Text(CardFront.getRankText(rank: card.rank))
                    .font(.system(size: 70, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.white)
                Spacer()
                
                HStack {
                    Spacer()
                    Image(systemName: CardFront.getSuitImageName(suit: card.suit))
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                }
            }
        }
    }
}
