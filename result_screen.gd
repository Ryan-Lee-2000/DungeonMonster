extends PanelContainer
@onready var gameover = $Gameover
@onready var victory = $Victory
@onready var game_scene = $"../.."

var player_data: Node
var inside = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Continue"):
		if not inside:
			return
		inside = false
		if gameover.visible == true:
			#gameover.hide()
			get_tree().quit()
			return
		if victory.visible == true:
			victory.hide()
		self.hide()
		game_scene.hide()
		player_data.get_tree().paused = false
		game_scene.clearResult()
	pass

func showResult(result: int, player: Node):
	inside = true
	player_data = player
	self.show()
	if result == 0:
		gameover.show()
	elif result == 1:
		victory.show()
	pass
