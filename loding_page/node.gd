@tool
extends Node2D

var colors = [Color.RED, Color.GREEN, Color.BLUE, Color.YELLOW, Color.PINK, Color.CYAN]
var triangles = []
var tween

func _ready():
	# 计算 6 个三角形的顶点
	for i in range(6):
		var angle = deg_to_rad(60 * i)
		var next_angle = deg_to_rad(60 * (i + 1))
		var p1 = Vector2(0, 0)
		var p2 = Vector2(cos(angle) * 100, sin(angle) * 100)
		var p3 = Vector2(cos(next_angle) * 100, sin(next_angle) * 100)
		triangles.append([p1, p2, p3])

	# 创建 Tween 实现颜色循环变化
	tween = get_tree().create_tween()
	_start_color_animation()

func _start_color_animation():
	for i in range(6):
		var target_color = colors[(i + 1) % 6]  # 颜色循环
		tween.tween_property(self, "modulate", target_color, 1.0).set_trans(Tween.TRANS_LINEAR)

func _draw():
	for i in range(6):
		draw_polygon(triangles[i], [colors[i]])
