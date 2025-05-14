extends TextureRect

class_name BotanyEntity

var pure_botany:Botany


func _init(pure_botany:Botany) -> void:
	self.pure_botany = pure_botany
	texture = pure_botany.textur
	

func update():
	texture = pure_botany.textur

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
