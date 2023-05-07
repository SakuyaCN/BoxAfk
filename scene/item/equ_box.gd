extends TextureRect

@export var type = ""

@onready var equ_type = $Label#装备类型
@onready var equ_image = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	equ_type.text = type

#设置格子装备信息
func setData(equ):
	equ_type.visible = equ == null
	if equ:
		equ_image.texture = load(equ.image)
		texture = load(ConstUtils.getQualityFrame(equ.quality))
	else:
		equ_image.texture = null
		texture = load(ConstUtils.getQualityFrame("凡品"))
		
