extends Node
var CompletedTasks = [] 
var electricity_num = 0
var gold_num = 0
var crystal_num = 0

signal electricity_num_changed(new_value:int)
signal gold_num_changed(new_value:int) 
signal crystal_num_changed(new_value:int) 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
