extends Node2D

@onready var waypoints: Node2D = $Waypoints
@onready var cards: Node2D = $Cards
@onready var queue_free_timer: Timer = $QueueFreeTimer

var cards_to_open
var revealed_card_count = 0

func _ready() -> void:
	cards_to_open = waypoints.get_child_count()
	_load_cards()
	SignalManager.reveal_card.connect(_handle_card_reveal)

func _load_cards() -> void:
	for waypoint in waypoints.get_children():
		var card = ComponentLoader.CARD.instantiate()
		card.position = (waypoint as Marker2D).position
		card.set_card_face(Constants.CardFace.BACK)
		cards.add_child(card)
		card.set_card_front(Utils.get_random_card())

func _handle_card_reveal() -> void:
	revealed_card_count += 1
	if revealed_card_count == cards_to_open:
		SignalManager.finished_opening_pack.emit()

func _process(_delta) -> void:
	if revealed_card_count == cards_to_open and Input.is_action_just_pressed("proceed"):
		queue_free()
		
