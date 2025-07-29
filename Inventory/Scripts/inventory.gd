extends Resource
class_name Inventory

@export var name: StringName
@export var slots: Array[Item] = []

signal item_change(indexes)

"""
	get the size of the slots
"""
func get_size() -> int:
	return slots.size()
pass
"""
	删除
"""
func remove_item(index: int) -> void:
	slots[index] = null
	item_change.emit([index])
pass
"""
	鼠标显示物品覆盖对应格子内物品
"""
func cover_item(index: int, target_item: Item) -> void:
	slots[index] = target_item
pass
"""
	设置对应索引的物品和数量
"""
func set_item(index: int, item: Item, quantity: int) -> void:
	slots[index].item = item
	if item == null:
		return
	item_change.emit([index])
pass

"""
	让资源唯一化
"""
func set_items_unique() -> void:
	var slots_size: int = slots.size()
	for index in slots_size:
		if slots[index] == null:
			continue
		slots[index] = slots[index].duplicate()
pass

func save_items(slots_datas: Resource, save_path: String) -> bool:
	# 确保目录存在
	var dir = save_path.get_base_dir()
	if not DirAccess.dir_exists_absolute(dir):
		DirAccess.make_dir_recursive_absolute(dir)
	# 保存资源
	var err = ResourceSaver.save(slots_datas, save_path)
	return err == OK
