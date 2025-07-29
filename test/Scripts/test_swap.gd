extends Control

@export var test_items: Array[Item]

@onready var mouse_slot: Node2D = $MouseSlot
var can_print_items: bool = true

@export var test_bag: Resource

func _ready() -> void:
	var bag_size: int = test_bag.get_size()
	test_items = test_bag.slots
	update_slot(range(bag_size))
	for index in bag_size:
		$HBoxContainer.get_child(index).gui_input.connect(_on_gui_input.bind(index))

func update_slot(indexes: Array) -> void:
	for index in indexes:
		if not index is int:
			assert(true, "index error")	
		
		$HBoxContainer.get_child(index).show_item(test_items[index])

func _on_gui_input(event: InputEvent, index: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("swap ", test_items[index])
			mouse_solt_swap_solt_item(test_items[index])



func mouse_solt_swap_solt_item(item: Item) -> void:
	var mouse_solt_item = mouse_slot.get_item()
	if mouse_solt_item != item:
		mouse_slot.set_show_item(item)
	else:
		item.item_add_quantity(mouse_solt_item.quantity)
	


func _process(delta: float) -> void:
	#print_items()
	pass
	
func print_items() -> void:
	if can_print_items:
		can_print_items = false
		print(test_items)
		print(">>", test_bag.slots)
		await get_tree().create_timer(1).timeout
		can_print_items = true
