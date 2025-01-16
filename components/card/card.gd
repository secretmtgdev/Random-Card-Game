extends StaticBody2D
@onready var card_animation_player: AnimationPlayer = $CardAnimationPlayer

var state = Constants.FlipState.IDLE
var face = Constants.CardFace.FRONT
func _ready() -> void:
	input_pickable = true
	if face == Constants.CardFace.FRONT:
		card_animation_player.play("front")
	else:
		card_animation_player.play("back")
	
func flip_card() -> void:
	if state == Constants.FlipState.IDLE and face == Constants.CardFace.FRONT or state == Constants.FlipState.FLIP_BACKWARD:
		state = Constants.FlipState.FLIP_FORWARD
		card_animation_player.play("flip")
	elif state == Constants.FlipState.IDLE and face == Constants.CardFace.BACK or state == Constants.FlipState.FLIP_FORWARD:
		state = Constants.FlipState.FLIP_BACKWARD
		card_animation_player.play("back_flip")
	_set_state()

func _set_state() -> void:
	match card_animation_player.current_animation:
		"front", "back":
			state = Constants.FlipState.IDLE
		"flip":
			state = Constants.FlipState.FLIP_FORWARD
		"back_flip":
			state = Constants.FlipState.FLIP_BACKWARD

func set_card_face(cardFace: Constants.CardFace) -> void:
	face = cardFace

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			flip_card()
