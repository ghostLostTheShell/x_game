@tool
extends Node2D

var colors = ["#000000", "#333333", "#999999", "#cccccc", "#ffffff"]
@onready var polygon2D0:Polygon2D = $Polygon2D0
@onready var polygon2D1:Polygon2D = $Polygon2D1
@onready var polygon2D2:Polygon2D = $Polygon2D2
@onready var polygon2D3:Polygon2D = $Polygon2D3
@onready var polygon2D4:Polygon2D = $Polygon2D4
@onready var polygon2D5:Polygon2D = $Polygon2D5
var frame_counter = 0
var color_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if frame_counter >= 20:  # 每 10 帧切换一次颜色
		frame_counter = 0  # 归零
		color_index = (color_index + 1) % colors.size()
		var color_index1 = (color_index + 1) % colors.size()
		var color_index2 = (color_index1 + 1) % colors.size()
		var color_index3 = (color_index2 + 1) % colors.size()
		var color_index4 = (color_index3 + 1) % colors.size()
		var color_index5 = (color_index4 + 1) % colors.size()
		polygon2D0.color = Color(colors[color_index])
		polygon2D1.color = Color(colors[color_index1])
		polygon2D2.color = Color(colors[color_index2])
		polygon2D3.color = Color(colors[color_index3])
		polygon2D4.color = Color(colors[color_index4])
		polygon2D5.color = Color(colors[color_index5])
		
	frame_counter = frame_counter + 1
