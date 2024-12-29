extends PanelContainer

@onready var monsterProfile = $HBoxContainer/VBoxContainer/Monster_profile
@onready var monsterStats = $HBoxContainer/MarginContainer/Monster_Stats
@onready var mainMenu = $"../MainMenu"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("close") and self.visible:
		monsterStats.resetScreen()
		mainMenu.show()
		self.hide()
	pass

func prepareCharacterScreen():
	monsterProfile.prepareMonsterProfile()
	monsterStats.prepareMonsterStats()
	pass
