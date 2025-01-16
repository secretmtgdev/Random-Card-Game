extends Node

var CURRENT_MODE = Constants.GameMode.ENDLESS

func set_game_mode(gameMode: Constants.GameMode) -> void:
	CURRENT_MODE = gameMode
