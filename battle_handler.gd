extends Node

class_name Battle_handler

func get_turn_order(player: Stats, enemy: Stats):
	var turn_order = []
	if player.spd > enemy.spd:
		turn_order = [player, enemy]
	elif enemy.spd > player.spd:
		turn_order = [enemy, player]
	else:
		var rng = RandomNumberGenerator.new()
		var coinflip = rng.randi_range(0,1)
		if coinflip == 0:
			turn_order = [player, enemy]
		else:
			turn_order = [enemy, player]
	
	return turn_order
	
