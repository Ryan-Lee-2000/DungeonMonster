extends PanelContainer

@onready var turn_counter = $Label

func update_turn(turn):
	turn_counter.text = "TURN\n" + str(turn)
	pass
