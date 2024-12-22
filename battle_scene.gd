extends CanvasLayer

const TextDisplay = preload("res://text_line.tscn")

var battle_start = false
@onready var screen = $MarginContainer/PanelContainer/VBoxContainer/PanelContainer/ScrollContainer/MarginContainer/VBoxContainer
@onready var scroll = $MarginContainer/PanelContainer/VBoxContainer/PanelContainer/ScrollContainer

var lineLimit = 20 #number of lines allowed to be displayed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if self.visible and not battle_start:
		print("The battle has begun!")
		battle_start = true
		preparefield()
		
	pass

func preparefield():
	for x in range(0,30):
		showText("Hey what's up lmao")
	pass

func showText(textToShow):
	var text = TextDisplay.instantiate()
	text.set_text(textToShow)
	screen.add_child(text)

func cleaningDuty():
	var childCount = screen.get_children()
	if(childCount.size() > lineLimit):
		screen.get_child(0).free()
