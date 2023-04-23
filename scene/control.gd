extends Control

@onready var gold_1 = $Top/TextureRect2/Label #金币1
@onready var gold_2 = $Top/TextureRect3/Label2 #金币2
@onready var exp = $Top/TextureRect4/Label3 #修为

@onready var label_base_attr = $Mid/TextureRect2/HBoxContainer #基础属性

func _init() -> void:
	PlayerData.onPlayerDataChange.connect(self.onPlayerDataChange)#当玩家基本信息发改变时
	PlayerData.onPlayerAttrChange.connect(self.onPlayerAttrChange)#当玩家基本属性发改变时

func _ready() -> void:
	PlayerData.loadData()#加载信息

#当玩家基本信息发改变时
func onPlayerDataChange():
	gold_1.text = "%s" %PlayerData.player_data["gold_1"]
	gold_2.text = "%s" %PlayerData.player_data["gold_2"]
	exp.text = "%s" %PlayerData.player_data["exp"]

#当玩家基本属性发改变时
func onPlayerAttrChange():
	var keys = PlayerData.player_attr.keys()
	var values = PlayerData.player_attr.values()
	var index = 0
	for label in label_base_attr.get_children():
		label.text = "%s : %s" %[ConstUtils.getAttrName(keys[index]),values[index]]
		index += 1

func _process(delta: float) -> void:
	pass
