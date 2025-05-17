extends Node
var CompletedTasks = [] 
var electricity_num = 100
var gold_num = 100
var crystal_num = 100


signal electricity_num_changed(new_value:int)
signal gold_num_changed(new_value:int) 
signal crystal_num_changed(new_value:int) 

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
