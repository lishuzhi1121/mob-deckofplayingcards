import mob_playingcard
import mob_fisheryates

public struct Deck {
    fileprivate var cards: [PlayingCard]
    
    public init(_ cards: [PlayingCard]) {
        self.cards = cards
    }
    
    public static func standard52Cards() -> Deck {
        let suits: [Suit] = [.spades, .hearts, .diamonds, .clubs]
        let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
        
        var cards: [PlayingCard] = []
        
        for rank in ranks {
            for suit in suits {
                cards.append(PlayingCard(rank: rank, suit: suit))
            }
        }
        
        return Deck(cards)
    }
    
    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func deal() -> PlayingCard? {
        guard !cards.isEmpty else {
            return nil
        }
        return cards.removeLast()
    }
}

// MARK: ExpressibleByArrayLiteral

extension Deck: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: PlayingCard...) {
        self.init(elements)
    }
}

// MARK: - Equatable

extension Deck: Equatable {
    static public func ==(lhs: Deck, rhs: Deck) -> Bool {
        return lhs.cards == rhs.cards
    }
}
