extends Node2D


@onready var item_texture: Sprite2D = $item_texture
@onready var number: Label = $item_texture/number

var temp_item_log: Item

func is_empty() -> bool:
	return item_texture.texture and number.text == ""

"""
	预处理： 隐藏子节点
"""
func _ready() -> void:
	clear_show_item()
	item_texture.hide()
pass
"""
	子节点显示处理
"""
func _process(delta: float) -> void:
	item_texture.visible = !is_empty()
pass
"""
	跟随鼠标移动
"""
func _physics_process(delta: float) -> void:
	#if slot.visible:
	global_position = get_global_mouse_position()
pass
"""
	@param: item: Item|null: 如果为 null 会清除子节点显示的物品， 为 Item 会替换物品
"""
func set_show_item(item: Item) -> void:
	if item == null:
		clear_show_item()
		return
	temp_item_log = item
	item_texture.texture = item.texture
	number.text = str(item.quantity)
pass
"""
	清除显示和记录的 Item
"""
func clear_show_item() -> void:
	temp_item_log = null
	item_texture.texture = null
	number.text = ""
pass
"""
	获取当前 Item
	@return Item|null
"""
func get_item() -> Item:
	return temp_item_log
pass
