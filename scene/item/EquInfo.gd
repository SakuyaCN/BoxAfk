extends Control

@onready var equ_panel = $EquPanel #新开的装备
@onready var equ_panel_up = $EquPanel2 #已穿戴的装备

@onready var attr_box = $EquPanel2/TextureRect3/ScrollContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#绑定数据
func setData(data,only_show = false):
	equ_panel.setData(data)
	
	if PlayerData.player_equ.has(data.type) && !only_show: #如果存在装备
		var up_info = PlayerData.player_equ[data.type] #获取已穿戴的装备
		equ_panel.contrast(up_info,data)
		setEqu(data,up_info)
	elif only_show:
		equ_panel.setButtonVisible(false)

#传入部位
func setEqu(data,up_info):
	equ_panel_up.setData(up_info)
	equ_panel_up.contrast(data,up_info)
	equ_panel_up.visible = true

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		queue_free()
