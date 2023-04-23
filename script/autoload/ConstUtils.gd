extends Node

var attr_type = {
	"hp" :"血量",
	"atk" :"攻击",
	"def" :"防御",
	"speed" :"速度"
}

func getAttrName(type):
	return attr_type[type]
