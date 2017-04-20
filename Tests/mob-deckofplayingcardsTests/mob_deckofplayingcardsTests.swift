import XCTest
@testable import mob_deckofplayingcards
@testable import mob_playingcard

class mob_deckofplayingcardsTests: XCTestCase {
    func testStandard52CardsDeck() {
        let reducer: ([PlayingCard], Rank) -> [PlayingCard] = { total, eachRank in
            let suits: [Suit] = [.spades, .hearts, .diamonds, .clubs]
            let subTotal = suits.map { eachSuit in
                PlayingCard(rank: eachRank, suit: eachSuit)
            }
            return total + subTotal
        }
        
        let ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14].map {Rank(rawValue: $0)}.flatMap {$0}
        let standard = ranks.reduce([PlayingCard](), reducer)
        
        XCTAssertEqual(Deck.standard52Cards(), Deck(standard))
    }

    func testDeal() {
        let card = PlayingCard(rank: .seven, suit: .hearts)
        var deck: Deck = [card]
        
        XCTAssertEqual(deck.deal(), card)
        XCTAssertNil(deck.deal())
    }
}
