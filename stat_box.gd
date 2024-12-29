extends HBoxContainer

@onready var stat_label = $Label
@onready var stat_bar = $MarginContainer/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup_box(label, value):
	stat_label.text = label
	stat_bar.value = value
