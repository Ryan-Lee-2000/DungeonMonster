extends Node2D
const dungeon_scene = preload("res://dungeon.tscn")
const battle_scene = preload("res://battle_scene.tscn")
var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_dungeon():
	add_child(dungeon_scene.instantiate())
	player = self.get_child(0).get_child(1)
	pass
