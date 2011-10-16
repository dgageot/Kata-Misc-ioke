use("ispec")

Deck = Origin mimic

Game = Origin mimic

Game initialize = method(deck1, deck2,
	self deck1 = deck1
	self deck2 = deck2)
	
Game winner = method(
	cond(
		 deck1 empty? &&  deck2 empty?, 0,
		!deck1 empty? &&  deck2 empty?, 1,
		 deck1 empty? && !deck2 empty?, 2,
		cond(
			deck1 draw == deck2 draw, 0,
			deck1 draw  > deck2 draw, 1,
			deck1 draw  < deck2 draw, 2
		)
	)
)

describe("game",
	it("",
		game = Game mimic(Deck mimic, Deck mimic)

		game deck1 empty? = false
		game deck2 empty? = true

		game winner should == 1
	)
	it("",
		game = Game mimic(Deck mimic, Deck mimic)

		game deck1 empty? = true
		game deck2 empty? = false

		game winner should == 2
	)
	it("",
		game = Game mimic(Deck mimic, Deck mimic)

		game deck1 empty? = true
		game deck2 empty? = true

		game winner should == 0
	)
	it("",
		game = Game mimic(Deck mimic, Deck mimic)

		game deck1 empty? = false
		game deck2 empty? = false
		game deck1 draw = 10
		game deck2 draw = 1

		game winner should == 1
	)
	it("",
		game = Game mimic(Deck mimic, Deck mimic)

		game deck1 empty? = false
		game deck2 empty? = false
		game deck1 draw = 1
		game deck2 draw = 10

		game winner should == 2
	)
	it("",
		game = Game mimic(Deck mimic, Deck mimic)

		game deck1 empty? = false
		game deck2 empty? = false
		game deck1 draw = 1
		game deck2 draw = 1

		game winner should == 0
	)
)