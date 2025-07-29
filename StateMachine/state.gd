class_name State
extends Node




@warning_ignore("unused_signal")
signal state_changed

func _on_enter() -> void:
    assert(false, "State::_on_enter() not implemented")

func _on_exit() -> void:
    assert(false, "State::_on_exit() not implemented")

func _on_process(_delta: float) -> void:
    assert(false, "State::_on_process() not implemented")

func _on_physics_process(_delta: float) -> void:
    assert(false, "State::_on_physics_process() not implemented")

func _on_change_state() -> void:
    assert(false, "State::_on_change_state() not implemented")
