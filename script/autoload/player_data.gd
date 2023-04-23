extends Node

const data_path = "user://user_data.json"

signal onPlayerDataChange() #当玩家信息变化时
signal onPlayerAttrChange() #当玩家属性变化时

var player_data = {}

#HP血量 ATK攻击 DEF防御 SPEED速度
var player_attr = {
	hp = 105,
	atk = 21,
	def = 5,
	speed = 10
}

func _ready() -> void:
	pass

func loadData():
	var file = FileAccess.open(data_path, FileAccess.READ)
	if file == null:
		firstLoad()
	else:
		var content = file.get_as_text()
		player_data = JSON.parse_string(content)
	emit_signal("onPlayerDataChange")
	emit_signal("onPlayerAttrChange")

func _saveData():
	var file = FileAccess.open(data_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(player_data))

func firstLoad():
	player_data = {
		gold_1 = 0,
		gold_2 = 0,
		exp = 0,
		player_attr = player_attr
	}
	_saveData()

#金币改变
func setGold(type,gold):
	player_data[type] += gold
	emit_signal("onPlayerDataChange")

func setAttr(type,value):
	player_attr[type] = value
	emit_signal("onPlayerAttrChange")
	
