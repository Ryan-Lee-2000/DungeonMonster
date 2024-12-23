extends CanvasLayer

#const TextDisplay = preload("res://text_line.tscn")
@onready var healthContainer = $MarginContainer/PanelContainer/VBoxContainer/PanelContainer/HealthContainer
@onready var enemy_content = $"../Player"

var player: Stats
var enemy: Stats
var turn = 1
var gameSpeed = 1 #number of seconds it takes for a turn

var battle_start = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if Input.is_action_just_pressed("close"):
		print("Close was pressed")
		self.hide()
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
	healthContainer.prep_health_boxes(player, enemy)
	pass

func battle():
	var current_player_life = player.life
	var current_enemy_life = enemy.life
	var turn_order = Battle_handler.new().get_turn_order(player,enemy)
	while current_enemy_life > 0 and current_player_life > 0:
		healthContainer.update_turn(turn)
		for attacker in turn_order:
			if attacker == player:
				current_enemy_life -= player.power - (enemy.def / 2)
				healthContainer.update_Healthbox(2, int(current_enemy_life))
				if current_enemy_life <= 0:
					print("Enemy life has been depleted!")
					break
			else:
				current_player_life -= enemy.power - (enemy.def / 2)
				healthContainer.update_Healthbox(0, int(current_player_life))
				if current_player_life <= 0:
					break
			await get_tree().create_timer(gameSpeed).timeout
		turn += 1
	await get_tree().create_timer(gameSpeed).timeout
	if current_player_life > 0:
		print("battle has ended")
		enemy_content.queue_free()
		self.hide()
		battle_start = false
	pass
	
