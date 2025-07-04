extends VBoxContainer

@onready var nameLabel = $"MarginContainer/VBoxContainer/Name"
@onready var healthBar = $"MarginContainer/VBoxContainer/HealthBar"
@onready var healthLabel = $"MarginContainer/VBoxContainer/Health"
#@onready var manaBar = $ManaBar
#@onready var manaLabel = $Mana


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

func editNameLabel(name_label):
	nameLabel.text = str(name_label)

func setHealthBar(current_health, health):
	healthBar.set_max(health)
	healthBar.set_value(current_health)
	healthLabel.set_text(str(current_health) + "/" + str(health))

#func setManaBar(mana):
	#if(mana <= 0):
		#manaBar.set_max(1)
		#manaBar.set_value(0)
		#manaLabel.set_text(str(mana) + "/" + str(mana))
		#return
	#manaBar.set_max(mana)
	#manaBar.set_value(mana)
	#manaLabel.set_text(str(mana) + "/" + str(mana))

func updatehealthBar(health):
	var maxHealth = healthBar.get_max()
	print(health)
	print(maxHealth)
	healthLabel.set_text(str(max(health, 0)) + "/" + str(maxHealth))
	var tween = create_tween()
	tween.tween_property(healthBar, "value", max(health, 0), 0.8)
	#healthBar.set_value(health)

#func updateManaBar(mana):
	#var maxMana = manaBar.get_max()
	#manaLabel.set_text(str(mana) + "/" + str(maxMana))
	#if(mana < 0):
		#manaBar.set_value(0)
		#return
	#manaBar.set_value(mana)
