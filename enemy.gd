extends Node2D
@onready var player = $"../Player"
@onready var tile_map = $"../TileMapLayer"
@onready var battle_scene = $"../BattleScene"

var astargrid: AStarGrid2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astargrid = AStarGrid2D.new()
	astargrid.region = tile_map.get_used_rect()
	astargrid.cell_size = Vector2i(12,12)
	astargrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astargrid.update()
	
	var region_size = astargrid.region.size
	var region_position = astargrid.region.position
	
	for x in region_size.x:
		for y in region_size.y:
			var tile_position = Vector2i(
				x + region_position.x,
				y + region_position.y
			)
			
			var tile_data = tile_map.get_cell_tile_data(tile_position)
			
			if tile_data == null or not tile_data.get_custom_data("walkable"):
				astargrid.set_point_solid(tile_position)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if Input.is_action_just_pressed("up"):
		move()
	elif Input.is_action_just_pressed("down"):
		move()
	elif Input.is_action_just_pressed("left"):
		move()
	elif Input.is_action_just_pressed("right"):
		move()

func move():
	var enemies = get_tree().get_nodes_in_group("Enemies")
	var occupied_positions = []
	
	for enemy in enemies:
		if enemy == self:
			continue
		occupied_positions.append(tile_map.local_to_map(enemy.global_position))
	
	for occupied_position in occupied_positions:
		astargrid.set_point_solid(occupied_position)
		
	
	var path = astargrid.get_id_path(
		tile_map.local_to_map(global_position),
		tile_map.local_to_map(player.global_position)
	)
	
	for occupied_position in occupied_positions:
		astargrid.set_point_solid(occupied_position, false)
		
	var distance = path.size()
	if distance > 6:
		return
	
	path.pop_front()
	
	if path.size() == 1:
		print("I have arrived at my target")
		###We need a way to pause the game when an encounter occurs so the user knows
		###who they are battling. (Possibility using an animation?
		battle_scene.show()
		return
	
	if path.is_empty():
		print("can't find path")
		return
	
	global_position = tile_map.map_to_local(path[0])
	
	
