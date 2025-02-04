extends Node

enum CardFace {
	FRONT,
	BACK	
}

enum FlipState {
	IDLE,
	FLIP_FORWARD,
	FLIP_BACKWARD
}

enum GameMode {
	NORMAL,
	ENDLESS
}

enum CardColor {
	RED,
	GREEN,
	BLUE,
	YELLOW,
	WILD
}

enum CardType {
	DRAW_TWO,
	CIRCLE,
	TRIANGLE,
	SQUARE,
	CROSS,
	BASIC,
	DRAW_FOUR
}

const CARD_COLORS = ["RED", "GREEN", "BLUE", "YELLOW", "WILD"]
const CARD_TYPES = ["DRAW_TWO", "CIRCLE", "TRIANGLE", "SQUARE", "CROSS"]
const WILD_CARD_TYPES = ["BASIC", "DRAW_FOUR"]
