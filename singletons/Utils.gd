extends Node

func get_random_color() -> String:
	return Constants.CARD_COLORS.pick_random()
 
func get_random_card_type() -> String:
	return Constants.CARD_TYPES.pick_random()
	
func get_random_wild_card_type() -> String:
	return Constants.WILD_CARD_TYPES.pick_random()
	
func get_random_card():
	var color = get_random_color()
	var type
	if color == "WILD":
		type = get_random_wild_card_type()
	else:
		type = get_random_card_type()
	var compressedImage = ImageLoader.CARD_MAP[color][type]
	var cardData = CardDetails.GET_CARD_DATA(color, type)
	return {
		"image": compressedImage,
		"details": cardData
	}

'''
CardDetails = {
	name: string;
	
	// Godot doesn't have a natural Set data structure
	// We could leverage a dictionary but the enums referenced could have the same key value
	// Since we are expecting a small amount of types per card, an array search is trivial
	types: 'Set'<CARD_TYPES | CARD_COLORS>;
	effect?: string; 			// applied after playing
	restriction?: string;		// Restriction is just a description of the rules
}
'''
func can_play_card(previousCard, currentCard) -> bool:
	# need to determine if there's an overlap
	for type in currentCard.types:
		if type in previousCard.types:
			return true
	return false

#func test_play_card() -> void:
	#var card_a = get_random_card().details
	#var card_b = get_random_card().details
	#print(card_a)
	#print(card_b)
	#print("CAN PLAY CARD?")
	#print(can_play_card(card_a, card_b))
