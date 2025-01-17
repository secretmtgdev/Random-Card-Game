extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reload"):
		_reload_world()

func _reload_world() -> void:
	get_tree().reload_current_scene()
