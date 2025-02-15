extends Node2D

@onready var waypoints: Node2D = $Waypoints
@onready var cards: Node2D = $Cards
@onready var card_animation_timer: Timer = $CardAnimationTimer

var cards_to_open
var revealed_card_count = 0
var flipping_all_cards = false

# Variables used to keep track of auto flipping and continutation of flipping
var cur_cards = []
var cur_card_index = 0

var _move_speed = 200
var _moved_cards = 0
var _waypoints = []

func _ready() -> void:
	cards_to_open = waypoints.get_child_count()
	_waypoints = waypoints.get_children()
	_load_cards()
	SignalManager.reveal_card.connect(_handle_card_reveal)
	
func _process(delta: float) -> void:	
	if not flipping_all_cards and Input.is_action_just_pressed("auto_open"):
		_flip_all_cards()
		
	elif flipping_all_cards and Input.is_action_just_pressed("auto_open"):
		_stop_auto_flip()
		
	if _moved_cards < len(cur_cards):
		_move_cards_to_waypoints(delta)

func _load_cards() -> void:
	for waypoint in _waypoints:
		var card = ComponentLoader.CARD.instantiate()
		card.position = (_waypoints[-1] as Marker2D).position
		card.set_card_face(Constants.CardFace.BACK)
		cards.add_child(card)
		cur_cards.append(card)
		var random_card = Utils.get_random_card()
		card.set_card_front(random_card.image)
		card.set_card_data(random_card.details)
		
func _move_cards_to_waypoints(delta: float) -> void:
	for i in range(len(cur_cards)):
		if not _waypoints[i]:
			continue
			
		var card = cur_cards[i]
		var waypoint = _waypoints[i]
		if card.position != (waypoint as Marker2D).position:
			card.position = card.position.move_toward((waypoint as Marker2D).position, delta * _move_speed)
		else:
			_moved_cards += 1
			_waypoints[i] = null # lazy deletion 
	
func _flip_all_cards() -> void:
	if cards.get_child_count() == 0:
		return
	
	flipping_all_cards = true
	card_animation_timer.start()
	
func _stop_auto_flip() -> void:
	flipping_all_cards = false
	card_animation_timer.stop()
		
func _flip_single_card():
	while cur_card_index < len(cur_cards) and (cur_cards[cur_card_index] as Card).is_card_revealed():
		cur_card_index += 1
	
	if cur_card_index >= len(cur_cards):
		return
	
	(cur_cards[cur_card_index] as Card).flip_card()
	cur_card_index += 1

func _handle_card_reveal() -> void:
	revealed_card_count += 1
	if revealed_card_count == cards_to_open:
		card_animation_timer.stop()
		SignalManager.finished_opening_pack.emit()

func _on_card_animation_timer_timeout() -> void:
	if cur_card_index >= len(cur_cards):
		card_animation_timer.stop()
		return
		
	_flip_single_card()
	
