extends Control


@export var bag: Resource

@onready var bag_grid_container: GridContainer = $BagUi/MarginContainer/GridContainer
@onready var mouse_slot: Node2D = $MouseSlot


func _ready() -> void:
	var bag_size: int = bag.get_size()
	update_slot(range(bag_size))
	for index in bag_size:
		bag_grid_container.get_child(index).gui_input.connect(_on_gui_input.bind(index))
		

func update_slot(indexes: Array) -> void:
	for index in indexes:
		if not index is int:	assert(true, "index error")	
		bag_grid_container.get_child(index).show_item(bag.slots[index])
	bag.set_items_unique()
	bag.save_items(bag, bag.resource_path)

func _on_gui_input(event: InputEvent, index: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				_on_mouse_button_left(index)
			MOUSE_BUTTON_RIGHT:
				_on_mouse_button_right(index)
	
pass
"""
	格子与鼠标拿起格子逻辑处理
	@param: index: int: 点击格子的索引
"""
func _on_mouse_button_left(index: int) -> void:
	#mouse_slot.set_show_item(slots[index])
	var current_slot_item: Item = bag.slots[index]
	var mouse_slot_item: Item = mouse_slot.get_item()
	# 格子和鼠标格子都为空
	if current_slot_item == null and mouse_slot_item == null:
		return
	# 格子和鼠标其中一个为空
	if current_slot_item == null or mouse_slot_item == null:
		bag.slots[index] = mouse_slot_item
		mouse_slot.set_show_item(current_slot_item)
	else:
		
		if current_slot_item.is_same_item(mouse_slot_item):
			# TODO 相同 鼠标未清空，并且资源没有唯一
			if current_slot_item.is_stackable():
				current_slot_item.item_add_quantity(mouse_slot_item)
				mouse_slot.clear_show_item()
		else:
			# 不相同直接互换
			mouse_slot.set_show_item(current_slot_item)
			bag.slots[index] = mouse_slot_item
			
	update_slot([index])

pass
func _on_mouse_button_right(index: int) -> void:
	update_slot([index])
