use("ispec")

Card = Origin mimic do(
	initialize = method(rank, color, @rank = rank. @color = color)
)

nOfAKind = fn(cards, n, (5..14) count (r, cards count(rank == r) == n))
pair = fn(cards, nOfAKind(cards, 2) == 1)
twoPairs = fn(cards, nOfAKind(cards, 2) == 2)
treeOfAKind = fn(cards, nOfAKind(cards, 3) == 1)
fourOfAKind = fn(cards, nOfAKind(cards, 4) == 1)
fullHouse = fn(cards, pair(cards) && treeOfAKind(cards))
flush = fn(cards, cards count(color == cards first color) == 5)
straight = fn(cards,
	let(sortedRanks, cards map(rank) sort,
		(sortedRanks last - sortedRanks first == 4) && nOfAKind(cards, 1) == 5
	)
)
straightFlush = fn(cards, straight(cards) && flush(cards))

toList = fn(hand, [straightFlush(hand), fourOfAKind(hand), fullHouse(hand), flush(hand), straight(hand), treeOfAKind(hand), twoPairs(hand), pair(hand)] map(f, if (f, 1, 0)))

isHigher = fn(hand1, hand2,
	toList(hand1) <=> toList(hand2) > 0
)


; SF S F FH F S T P2 P1 (H5 H4 H3 H2 H1)

describe("cards",
	it("should recognize a pair",
		pair([Card mimic(5, "C"), Card mimic(5, "H"), Card mimic(6, "H"), Card mimic(7, "H"), Card mimic(8, "H")]) should == true
	)
	it("should recognize two pairs",
		twoPairs([Card mimic(5, "C"), Card mimic(5, "H"), Card mimic(6, "H"), Card mimic(6, "H"), Card mimic(8, "H")]) should == true
	)
	it("should recognize three of a kind",
		treeOfAKind([Card mimic(5, "C"), Card mimic(5, "H"), Card mimic(5, "H"), Card mimic(6, "H"), Card mimic(8, "H")]) should == true
	)
	it("should recognize a straight",
		straight([Card mimic(5, "C"), Card mimic(6, "H"), Card mimic(7, "H"), Card mimic(8, "H"), Card mimic(9, "H")]) should == true
	)
	it("should recognize a flush",
		flush([Card mimic(5, "C"), Card mimic(6, "C"), Card mimic(7, "C"), Card mimic(8, "C"), Card mimic(10, "C")]) should == true
	)
	it("should recognize a full house",
		fullHouse([Card mimic(5, "C"), Card mimic(5, "H"), Card mimic(5, "H"), Card mimic(8, "H"), Card mimic(8, "H")]) should == true
	)
	it("should recognize four of a kind",
		fourOfAKind([Card mimic(5, "C"), Card mimic(5, "H"), Card mimic(5, "H"), Card mimic(5, "H"), Card mimic(8, "H")]) should == true
	)
	it("should recognize straight flush",
		straightFlush([Card mimic(5, "C"), Card mimic(6, "C"), Card mimic(7, "C"), Card mimic(8, "C"), Card mimic(9, "C")]) should == true
	)
)

describe("hand",
	it("should recognize two pairs higher than are a pair",
		twoPairs = [Card mimic(5, "C"), Card mimic(5, "H"), Card mimic(6, "H"), Card mimic(6, "H"), Card mimic(8, "H")]
		pair = [Card mimic(5, "C"), Card mimic(5, "H"), Card mimic(6, "H"), Card mimic(7, "H"), Card mimic(8, "H")]
		
		isHigher(twoPairs, pair) should == true
	)
)