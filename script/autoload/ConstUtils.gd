extends Node

var attr_type = {
	"hp" :"血量",
	"atk" :"攻击",
	"def" :"防御",
	"speed" :"速度"
}

var quality_frame = {
	"凡品" :"res://texutre/common_board_quality_white.png",
	"中品" :"res://texutre/common_board_quality_green.png",
	"上品" :"res://texutre/common_board_quality_blue.png"
}

#装备类型
var equ_type = ["头饰","项链","戒指","外袍","腰带","下装","鞋子","法器","护腕","护符","肩胛"]

#装备品质
var equ_quality = ["凡品","中品","上品"]

var quality_num = {
	"凡品":0.8,
	"中品":1.0,
	"上品":1.2
}

#获取属性名称
func getAttrName(type):
	return attr_type[type]

#获取装备品质对应的边框
func getQualityFrame(type):
	return quality_frame[type]

#创建一件装备
#type 装备类型
func createEqu(type,quality):
	var equ = {
		type = type, #类型
		quality = quality,#品质
		attr = { #属性
			atk = quality_num[quality] * 10,
			def = quality_num[quality] * 5,
			hp = quality_num[quality] * 50
		},
		image = "res://texutre/equ/icon_bs_10001.png", #图片
		lv = 1 #等级
	}
	return equ
