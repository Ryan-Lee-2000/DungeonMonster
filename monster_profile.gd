extends HBoxContainer
@onready var nicknameLabel = $VBoxContainer/Nickname_label
@onready var speciesLabel = $VBoxContainer/Species_label
@onready var main_node = $"../../../../.."
@onready var sprite = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#speciesLabel.text = str(player_stats.species[0])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func prepareMonsterProfile():
	var player_stats = main_node.retrievePlayerMonster()
	nicknameLabel.text = "Name: " + str(player_stats.nickname)
	speciesLabel.text = str(player_stats.species[0])
	sprite.texture = load(player_stats.sprite_data)
	pass
