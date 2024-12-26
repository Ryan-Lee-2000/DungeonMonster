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
	print("I'm running")
	if Input.is_action_just_pressed("Continue"):
		if not inside:
			return
		print("I'm being pressed")
		if gameover.visible == true:
			gameover.hide()
		if victory.visible == true:
			victory.hide()
		self.hide()
		game_scene.hide()
		player_data.get_tree().paused = false
		game_scene.clearResult()
	pass

func showResult(result: int, player: Node):
	inside = true
	prints("Hello ", result)
	player_data = player
	self.show()
	if result == 0:
		gameover.show()
	elif result == 1:
		victory.show()
	prints(self.visible, gameover.visible, victory.visible)
	pass
