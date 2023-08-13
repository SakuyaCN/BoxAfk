extends TextureRect

const equ_item_pre = preload("res://scene/item/EquInfo.tscn")

@export var type = ""

@onready var equ_type = $Label#装备类型
@onready var equ_image = $TextureRect

var local_equ = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	equ_type.text = type

#设置格子装备信息
func setData(equ):
	equ_type.visible = equ == null
	local_equ = equ
	if equ:
		equ_image.texture = load(equ.image)
		texture = load(ConstUtils.getQualityFrame(equ.quality))
	else:
		equ_image.texture = null
		texture = load(ConstUtils.getQualityFrame("凡品"))
		

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		var ins = equ_item_pre.instantiate()
		owner.add_child(ins)
		ins.setData(local_equ,true)
