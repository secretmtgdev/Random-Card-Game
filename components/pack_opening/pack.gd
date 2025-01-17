extends StaticBody2D

@export var CENTER_OF_WORLD: Marker2D
@onready var pack_sprite: Sprite2D = $PackSprite
@onready var pack_collider: CollisionShape2D = $PackCollider

func _ready() -> void:
	input_pickable = true
	SignalManager.finished_opening_pack.connect(handle_finished_pack)

func handle_finished_pack() -> void:
	print("Pack opened!")

func open_pack() -> void:
	pack_sprite.hide()
	pack_collider.disabled = true
	var pack_opening: Node = ComponentLoader.PACK_OPENING.instantiate()
	
	# sets the position relative to the worlds positioning
	pack_opening.position = CENTER_OF_WORLD.get_parent().global_position
	add_child(pack_opening)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			open_pack()
