extends Node

# Some cards (draw) don't have a restriction, should be nullable
# Some cards don't have an effect, should be nullable
# All cards have a default point value of 1, this is subject to change
var CARD_DATA_MAP = {
	"RED": {
		"DRAW_TWO": {
			"name": "Draw two red",
			"effect": "Draw two cards",
			"types": [Constants.CardColor.RED, Constants.CardType.DRAW_TWO]
		},
		"CIRCLE": {
			"name": "Red circle",
			"restriction": "Play only on a red card of circle",
			"types": [Constants.CardColor.RED, Constants.CardType.CIRCLE]
		},
		"TRIANGLE": {
			"name": "Red triangle",
			"restriction": "Play only on a red card or triangle",
			"types": [Constants.CardColor.RED, Constants.CardType.TRIANGLE]
		},
		"SQUARE":{
			"name": "Red square",
			"restriction": "Play only on a red card or square",
			"types": [Constants.CardColor.RED, Constants.CardType.SQUARE]
		},
		"CROSS": {
			"name": "Red cross",
			"restriction": "Play only on a red card or cross",
			"types": [Constants.CardColor.RED, Constants.CardType.CROSS]
		},
	},
	"GREEN": {
		"DRAW_TWO": {
			"name": "Draw two green",
			"effect": "Draw two cards",
			"types": [Constants.CardColor.GREEN, Constants.CardType.DRAW_TWO]
		},
		"CIRCLE": {
			"name": "Green circle",
			"restriction": "Play only on a green card or circle",
			"types": [Constants.CardColor.GREEN, Constants.CardType.CIRCLE]
		},
		"TRIANGLE": {
			"name": "Green triangle",
			"restriction": "Play only on a green card or triangle",
			"types": [Constants.CardColor.GREEN, Constants.CardType.TRIANGLE]
		},
		"SQUARE": {
			"name": "Green square",
			"restriction": "Play only on a green card or square",
			"types": [Constants.CardColor.GREEN, Constants.CardType.SQUARE]
		},
		"CROSS": {
			"name": "Green cross",
			"restriction": "Play only on a green card or cross",
			"types": [Constants.CardColor.GREEN, Constants.CardType.CROSS]
		},
	},
	"BLUE": {
		"DRAW_TWO":{
			"name": "Draw two blue",
			"effect": "Draw two cards",
			"types": [Constants.CardColor.BLUE, Constants.CardType.DRAW_TWO]
		},
		"CIRCLE": {
			"name": "Blue circle",
			"restriction": "Play only on a blue card or circle",
			"types": [Constants.CardColor.BLUE, Constants.CardType.CIRCLE]
		},
		"TRIANGLE": {
			"name": "Blue triangle",
			"restriction": "Play only on a blue card or triangle",
			"types": [Constants.CardColor.BLUE, Constants.CardType.TRIANGLE]
		},
		"SQUARE": {
			"name": "Blue square",
			"restriction": "Play only on a blue card or square",
			"types": [Constants.CardColor.BLUE, Constants.CardType.SQUARE]
		},
		"CROSS": {
			"name": "Blue cross",
			"restriction": "Play only on a blue card or cross",
			"types": [Constants.CardColor.BLUE, Constants.CardType.CROSS]
		},
	},
	"YELLOW": {
		"DRAW_TWO": {
			"name": "Draw two yellow",
			"effect": "Draw two cards",
			"types": [Constants.CardColor.YELLOW, Constants.CardType.DRAW_TWO]
		},
		"CIRCLE": {
			"name": "Yellow circle",
			"restriction": "Play only on a yellow card or circle card",
			"types": [Constants.CardColor.YELLOW, Constants.CardType.CIRCLE]
		},
		"TRIANGLE": {
			"name": "Yellow triangle",
			"restriction": "Play only on a yellow card or triangle card",
			"types": [Constants.CardColor.YELLOW, Constants.CardType.TRIANGLE]
		},
		"SQUARE": {
			"name": "Yellow square",
			"restriction": "Play only on a yellow card or square card",
			"types": [Constants.CardColor.YELLOW, Constants.CardType.SQUARE]
		},
		"CROSS": {
			"name": "Yellow cross",
			"restriction": "Play only on a yellow card or cross card",
			"types": [Constants.CardColor.YELLOW, Constants.CardType.CROSS]
		},
	},
	"WILD": {
		"BASIC":{
			"name": "Wild card",
			"effect": "Play on any other card",
			"types": [Constants.CardColor.WILD, Constants.CardType.BASIC]
		},
		"DRAW_FOUR": {
			"name": "Draw four cards",
			"effect": "Draw four cards",
			"types": [Constants.CardColor.WILD, Constants.CardType.DRAW_FOUR]
		},
	}
}

func GET_CARD_DATA(color, type):
	return CARD_DATA_MAP[color][type]
