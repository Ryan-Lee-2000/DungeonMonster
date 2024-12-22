extends CanvasLayer

var battle_start = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if self.visible and not battle_start:
		print("The battle has begun!")
		battle_start = true
		preparefield()
		
	pass

func preparefield():
	
	pass
