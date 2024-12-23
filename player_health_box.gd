extends VBoxContainer

@onready var nameLabel = $Name
@onready var healthBar = $HealthBar
@onready var healthLabel = $Health
#@onready var manaBar = $ManaBar
#@onready var manaLabel = $Mana


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func editNameLabel(name):
	nameLabel.set_text(name)

func setHealthBar(health):
	healthBar.set_max(health)
	healthBar.set_value(health)
	healthLabel.set_text(str(health) + "/" + str(health))

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
	healthLabel.set_text(str(health) + "/" + str(maxHealth))
	if(health < 0):
		healthBar.set_value(0)
		return
	healthBar.set_value(health)

#func updateManaBar(mana):
	#var maxMana = manaBar.get_max()
	#manaLabel.set_text(str(mana) + "/" + str(maxMana))
	#if(mana < 0):
		#manaBar.set_value(0)
		#return
	#manaBar.set_value(mana)
