extends TextureRect

@export var type = ""

@onready var equ_type = $Label#装备类型

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	equ_type.text = type

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
