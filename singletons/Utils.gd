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
	return compressedImage
