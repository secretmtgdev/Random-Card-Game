extends Node2D

@onready var waypoints: Node2D = $Waypoints
@onready var cards: Node2D = $Cards

func _ready() -> void:
	_load_cards()

func _load_cards() -> void:
	for waypoint in waypoints.get_children():
		var card = ComponentLoader.CARD.instantiate()
		card.position = (waypoint as Marker2D).position
		card.set_card_face(Constants.CardFace.BACK)
		cards.add_child(card)
