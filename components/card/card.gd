class_name Card extends StaticBody2D

@onready var card_animation_player: AnimationPlayer = $CardAnimationPlayer
@onready var card_front: Sprite2D = $CardSpriteContainer/CardFront
@onready var card_flip_audio: AudioStreamPlayer2D = $CardFlipAudio

var animation_scalar = 2.0
var state = Constants.FlipState.IDLE
var face = Constants.CardFace.FRONT
var _has_been_revealed = false

# needs to be called once the component is loaded into the tree
func set_card_front(image) -> void:
	card_front.texture = image
	
func is_card_revealed() -> bool:
	return _has_been_revealed

func _ready() -> void:
	input_pickable = true
	card_animation_player.speed_scale *= animation_scalar
	if face == Constants.CardFace.FRONT:
		card_animation_player.play("front")
	else:
		card_animation_player.play("back")
	
func flip_card() -> void:
	card_flip_audio.play(1)
	if state == Constants.FlipState.IDLE and face == Constants.CardFace.FRONT or state == Constants.FlipState.FLIP_BACKWARD:
		state = Constants.FlipState.FLIP_FORWARD
		card_animation_player.play("flip")
	elif state == Constants.FlipState.IDLE and face == Constants.CardFace.BACK or state == Constants.FlipState.FLIP_FORWARD:
		state = Constants.FlipState.FLIP_BACKWARD
		card_animation_player.play("back_flip")
		if not _has_been_revealed:
			SignalManager.reveal_card.emit()
		_has_been_revealed = true
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
