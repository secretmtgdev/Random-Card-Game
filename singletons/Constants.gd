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

const CARD_COLORS = ["RED", "GREEN", "BLUE", "YELLOW", "WILD"]
const CARD_TYPES = ["DRAW_TWO", "CIRCLE", "TRIANGLE", "SQUARE", "CROSS"]
const WILD_CARD_TYPES = ["BASIC", "DRAW_FOUR"]
