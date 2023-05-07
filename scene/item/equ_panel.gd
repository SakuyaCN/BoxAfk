extends NinePatchRect

@onready var equ_name = $TextureRect3/Label #装备名称
@onready var equ_frame = $TextureRect2 #装备品质框
@onready var equ_image = $TextureRect2/TextureRect4 #装备图片
@onready var equ_attr = $TextureRect3/ScrollContainer/VBoxContainer #装备属性
@onready var equ_attr_label = $TextureRect3/ScrollContainer/VBoxContainer/Label
var equ_data

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#绑定装备属性
func setData(equ_data):
	self.equ_data = equ_data
	if equ_data:
		reload()

#绑定UI
func reload():
	equ_name.text = "[%s] %s" %[equ_data.quality,equ_data.type] #绑定名称
	equ_image.texture = load(equ_data.image) #绑定图片
	equ_frame.texture = load(ConstUtils.getQualityFrame(equ_data.quality)) #绑定外框
	for item in equ_data.attr: #绑定属性
		var equ_label :Label= equ_attr_label.duplicate()
		equ_label.name = item
		equ_label.visible = true
		equ_label.text = "%s     %s" %[ConstUtils.getAttrName(item),equ_data.attr[item]] #绑定属性
		equ_attr.add_child(equ_label)

#装备对比
func contrast(data,up_info):
	for attr_name in data.attr:
		var node = equ_attr.get_node(attr_name)
		if data.attr[attr_name] > up_info.attr[attr_name]:
			node.set("theme_override_colors/font_color",Color.BROWN)
			node.text += "↓"
		elif data.attr[attr_name] < up_info.attr[attr_name]:
			node.set("theme_override_colors/font_color",Color.WEB_GREEN)
			node.text += "↑"

func _on_button_pressed() -> void:
	PlayerData.equ_up(equ_data) #穿戴装备
	get_parent().queue_free() #关闭页面
