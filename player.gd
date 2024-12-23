extends Node2D

@onready var tile_map = $"../TileMapLayer"

@onready var raycast = $RayCast2D

@onready var battle_scene = $"../BattleScene"

var player_stats = Stats.new()
var check = true

func _process(_delta) -> void:
	if check:
		check = false
		initialize_creature()
		
	if Input.is_action_just_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_just_pressed("down"):
		move(Vector2.DOWN)
	elif Input.is_action_just_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_just_pressed("right"):
		move(Vector2.RIGHT)
	pass

func move(direction: Vector2):
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y
	)
	var tile_data: TileData = tile_map.get_cell_tile_data(target_tile)
	if tile_data.get_custom_data("walkable") == false:
		return
		
	raycast.target_position = direction * 12
	raycast.force_raycast_update()
	if raycast.is_colliding():
		return
	
	global_position = tile_map.map_to_local(target_tile)

func initialize_creature():
	player_stats.init_testing_creature("Skeleton")
	battle_scene.updatePlayer(player_stats)
	pass
