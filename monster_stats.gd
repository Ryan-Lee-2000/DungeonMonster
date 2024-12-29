extends VBoxContainer
@onready var main_node = $"../../../../.."

const stat_box = preload("res://stat_box.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func prepareMonsterStats():
	var stat_types = ["LIFE", "POW", "INT", "SKI", "DEF", "SPD"]
	var player_stats = main_node.retrievePlayerMonster()
	var stat_array = player_stats.get_stats()
	for x in range(len(stat_array)):
		self.add_child(stat_box.instantiate())
		self.get_child(x + 1).setup_box(stat_types[x], stat_array[x])
	pass
