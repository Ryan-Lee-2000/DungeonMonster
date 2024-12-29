extends Node2D
const dungeon_scene = preload("res://dungeon.tscn")
const battle_scene = preload("res://battle_scene.tscn")

var player_stats = Stats.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_stats.init_testing_creature("Goblin")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func retrievePlayerMonster():
	return player_stats

func start_dungeon():
	add_child(dungeon_scene.instantiate())
	pass
