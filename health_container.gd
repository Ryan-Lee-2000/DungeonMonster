extends HBoxContainer
const healthbox = preload("res://health_box.tscn")
const turnbox = preload("res://turn_box.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(healthbox.instantiate())
	add_child(turnbox.instantiate())
	add_child(healthbox.instantiate())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func prep_health_boxes(player: Stats, enemy: Stats):
	print(player.nickname)
	
	get_child(0).editNameLabel(player.nickname)
	get_child(0).setHealthBar(player.life)
	
	get_child(1).update_turn(1)
	
	get_child(2).editNameLabel(enemy.nickname)
	get_child(2).setHealthBar(enemy.life)
	
	pass

func update_Healthbox(side: int, health: int):
	get_child(side).updatehealthBar(health)
	pass

func update_turn(turn: int):
	get_child(1).update_turn(turn)
	pass
