class_name StateMachine
extends Node

@export var initState: State

var states: Dictionary = {}
var current_state: State
var current_state_name: StringName
var current_character: String


func _ready() -> void:
    current_character = get_parent().name 

    for child in get_children():
        if child is State:
            states[child.name.to_lower()] = child
            child.transition.connect(_on_transition)
    
    if initState and states.has(initState.to_lower()):
        initState._on_enter()
        current_state_name = initState.name.to_lower()
        current_state = initState

func _process(_delta: float) -> void:
    if current_state:
        current_state._on_process(_delta)

func _physics_process(_delta: float) -> void:
    if current_state:
        current_state._on_physics_process(_delta)
        current_state._on_change_state()

func _on_transition(new_state: StringName) -> void:
    if current_state_name == new_state:
        return  
    if states.has(new_state.to_lower()):
        var state = states.get(new_state.to_lower())
        if !state:
            assert(false, "State not found: " + new_state)
        
        current_state._on_exit()
        current_state = state;
        current_state_name = new_state
        current_state._on_enter()
    else:
        assert(false, "State not found: " + new_state)
