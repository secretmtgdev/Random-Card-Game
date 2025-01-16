extends Node2D

func _process(delta: float) -> void:
	toggle_endless()
		
func toggle_endless() -> void:
	if Input.is_action_just_pressed("endless"):
		if GameManager.CURRENT_MODE == Constants.GameMode.ENDLESS:
			GameManager.set_game_mode(Constants.GameMode.NORMAL)
		else:
			GameManager.set_game_mode(Constants.GameMode.ENDLESS)
