extends Control
@onready var game = $".."
@onready var mainmenu = $MainMenu
@onready var characterScreen = $CharacterScreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass



func _on_button_pressed() -> void:
	self.hide()
	game.start_dungeon()
	pass # Replace with function body.


func _on_character_button_pressed() -> void:
	characterScreen.prepareCharacterScreen()
	mainmenu.hide()
	characterScreen.show()
	pass # Replace with function body.
