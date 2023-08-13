extends Node

const data_path = "user://user_data.json"

signal onPlayerDataChange() #当玩家信息变化时
signal onPlayerAttrChange() #当玩家属性变化时
signal onPlayerEquChange() #当玩家装备变化时

var player_data = {}#玩家基本信息
var player_equ = {} #玩家穿戴装备

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
	emit_signal("onPlayerEquChange")

func _saveData():
	var file = FileAccess.open(data_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(player_data))

#重置玩家属性
func resetPlayerAttr():
	player_attr = {
		hp = 105,
		atk = 21,
		def = 5,
		speed = 10
	}

func firstLoad():
	player_data = {
		gold_1 = 0,
		gold_2 = 0,
		exp = 0,
		player_attr = player_attr,
		player_equ = player_equ
	}
	_saveData()

#金币改变
func setGold(type,gold):
	player_data[type] += gold
	emit_signal("onPlayerDataChange")

#改变玩家属性
func setAttr(type,value):
	if player_attr.has(type):
		player_attr[type] += value
	else:
		player_attr[type] = value
	#emit_signal("onPlayerAttrChange")

#穿戴装备
#equ 装备信息
func equ_up(equ):
	player_equ[equ.type] = equ
	emit_signal("onPlayerEquChange")
	reloadAttr()

#刷新角色属性
func reloadAttr():
	resetPlayerAttr()
	for equ in player_equ:#遍历玩家装备
		for attr_item in player_equ[equ].attr:#遍历装备属性
			setAttr(attr_item,player_equ[equ].attr[attr_item])
	emit_signal("onPlayerAttrChange")
