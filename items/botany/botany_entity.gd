extends TextureRect

class_name BotanyEntity

var pure_botany:Botany

var state:TextureRect 
var state_txt:Label
static var state_texture = load("res://textures/ui/state/阶段框.png")

func _init(pure_botany:Botany) -> void:
	self.pure_botany = pure_botany
	texture = pure_botany.textur
	state = TextureRect.new()
	state.visible=false
	state.texture = state_texture
	state.position=Vector2(45, 0)
	state_txt = Label.new()
	state_txt.text = "1阶段"
	state_txt.position=Vector2(10, 5)
	state.add_child(state_txt)
	self.add_child(state)
	
	
func update():
	texture = pure_botany.textur
	
	
	if  pure_botany.state == Botany.PlantGrowthStage.SEED:
		state_txt.text = "1阶段"
				
	elif pure_botany.state == Botany.PlantGrowthStage.SPROUT:
		state_txt.text = "1阶段"
			
	elif pure_botany.state == Botany.PlantGrowthStage.YOUNG:
		state_txt.text = "2阶段"
			
	elif pure_botany.state == Botany.PlantGrowthStage.MATURE:
		state_txt.text = "3阶段"
	
	elif pure_botany.state == Botany.PlantGrowthStage.FLOWERING:
		state_txt.text = "4阶段"
	elif pure_botany.state == Botany.PlantGrowthStage.FRUITING:
		state_txt.text = "5阶段"


func _ready() -> void:
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)

func _on_mouse_entered():
	print("鼠标进入")
	state.visible=true
	state.position=Vector2(45, 0)
	
func _on_mouse_exited():
	state.visible=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
