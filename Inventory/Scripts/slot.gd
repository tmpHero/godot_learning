extends Control
class_name Slot

@onready var item_texture: Sprite2D = $item_texture
@onready var number: Label = $number

var temp_item_log: Item

func clear() -> void:
	temp_item_log = null
	item_texture.texture = null
	number.text = ""

func show_item(item: Item) -> void:
	if item == null:
		clear()
		return
	temp_item_log = item
	item_texture.texture = item.texture
	number.text = str(item.quantity)
	number.visible = item.is_stackable()
	
func get_item() -> Item:
	return temp_item_log

func slot_is_empty() -> bool:
	return temp_item_log == null
