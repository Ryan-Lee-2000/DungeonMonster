extends CanvasLayer

#const TextDisplay = preload("res://text_line.tscn")
@onready var healthContainer = $MarginContainer/BackgroundColor/VBoxContainer/PanelContainer/HealthContainer
@onready var enemy_content = $"../Player"
@onready var player_scene = $"../Player"
@onready var player_icon = $MarginContainer/BackgroundColor/VBoxContainer/Monster_split/HBoxContainer/MarginContainer/TextureRect
@onready var enemy_icon = $MarginContainer/BackgroundColor/VBoxContainer/Monster_split/HBoxContainer/MarginContainer2/TextureRect
@onready var result_screen = $"MarginContainer/Result Screen"
@onready var overall_screen = $MarginContainer

const result_screen_scene = preload("res://result_screen.tscn")

var player: Stats
var enemy: Stats
var turn = 1
var gameSpeed = 1 #number of seconds it takes for a turn

var battle_start = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if self.visible:
		player_scene.get_tree().paused = true
	else:
		player_scene.get_tree().paused = false
	if Input.is_action_just_pressed("close"):
		print("Close was pressed")
		self.hide()
		player_scene.get_tree().paused = false
		battle_start = false
		return
	if Input.is_action_just_pressed("debug_open_battle_scene"):
		battle_start = true
		self.show()
	if self.visible and not battle_start:
		print("The battle has begun!")
		battle_start = true
		start()
		
	pass

func updatePlayer(player_data: Stats):
	player = player_data
	pass
	
func updateEnemyContent(content):
	print("Enemy content being updated! (" + str(self.get_path_to(content)) + ")")
	enemy_content = get_node(self.get_path_to(content))
	pass

func updateEnemy(enemy_data: Stats):
	print("Enemy info has been updated")
	enemy = enemy_data
	pass	

func start():
	turn = 1
	preparefield()
	self.show()
	battle()
	pass

func preparefield():
	player_icon.texture = load(player.sprite_data)
	enemy_icon.texture = load(enemy.sprite_data)
	healthContainer.prep_health_boxes(player, enemy)
	pass

func battle():
	var turn_order = Battle_handler.new().get_turn_order(player,enemy)
	while enemy.current_hp > 0 and player.current_hp > 0:
		healthContainer.update_turn(turn)
		for attacker in turn_order:
			if attacker == player:
				enemy.current_hp -= max(player.power - (enemy.def / 2), 1)
				healthContainer.update_Healthbox(2, int(enemy.current_hp))
				if enemy.current_hp <= 0:
					print("Enemy life has been depleted!")
					break
			else:
				player.current_hp -= max(enemy.power - (enemy.def / 2), 1)
				healthContainer.update_Healthbox(0, int(player.current_hp))
				if player.current_hp <= 0:
					break
			await get_tree().create_timer(gameSpeed).timeout
		turn += 1
	await get_tree().create_timer(gameSpeed).timeout
	
	if player.current_hp > 0:
		print("battle has ended")
		enemy_content.queue_free()
		battle_start = false
		overall_screen.add_child(result_screen_scene.instantiate())
		overall_screen.get_child(1).showResult(1, player_scene)
		#self.hide()
		#player_scene.get_tree().paused = false
	else:
		print("battle has ended, and you've lost")
		enemy_content.queue_free()
		battle_start = false
		overall_screen.add_child(result_screen_scene.instantiate())
		overall_screen.get_child(1).showResult(0, player_scene)
	pass

func clearResult():
	overall_screen.remove_child(overall_screen.get_child(1))
	pass
