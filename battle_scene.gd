extends CanvasLayer

#const TextDisplay = preload("res://text_line.tscn")

var battle_start = false
@onready var screen = $MarginContainer/PanelContainer/VBoxContainer/PanelContainer/ScrollContainer/MarginContainer/VBoxContainer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if Input.is_action_just_pressed("close"):
		print("Close was pressed")
		self.hide()
		battle_start = false
		return
	if self.visible and not battle_start:
		print("The battle has begun!")
		battle_start = true
		preparefield()
		
	pass

func preparefield():
	pass
