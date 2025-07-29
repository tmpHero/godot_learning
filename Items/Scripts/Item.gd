# Item.gd (继承 Resource)
class_name Item
extends Resource

@export var id: StringName = ""               # 唯一标识符
@export var name: String = "Unnamed"      # 显示名称
@export var texture: Texture2D            # 图标
@export var max_stack: int = 64            # 最大堆叠数
@export var quantity: int = 1             # 当前数量

"""
	是否可以堆叠
"""
func is_stackable() -> bool:
	return max_stack > 1
pass
"""
	是否达到最大堆叠数
"""
func is_max_stack() -> bool:
	return quantity == max_stack
pass
"""
	格子里是否为空
"""
func is_empty() -> bool:
	return id == ""
pass
"""
	清理物品
"""
func clear() -> void:
	id = ""
	name = "Unnamed"
	texture = null                     
	quantity = 0             
pass
"""
	是否是相同物品
"""
func is_same_item(target_item: Item) -> bool:
	if target_item == null:
		return id == ""
	return id == target_item.id
pass
"""
	相同物品添加目标物品的数量，当目标物品数量上限不再添加
	@param mouse_slot_item: 鼠标上对应的 Item
	@param is_check: 如果为 false 直接添加， 为 true 会检查是否溢出
"""
func item_add_quantity(mouse_slot_item: Item) -> void:
	var extra_quantiry: int = 0
	var add_result := quantity + mouse_slot_item.quantity
	if add_result > max_stack:
		quantity = max_stack
		mouse_slot_item.quantity = add_result - max_stack
	else:
		quantity = add_result
pass
	
