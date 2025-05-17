"""
生菜
"""
extends Botany
class_name Lettuce

static var _seed_texture = load("res://textures/items/letuce/生菜种子.png")
static var _1_texture = load("res://textures/items/letuce/letuce_1.png")
static var _2_texture = load("res://textures/items/letuce/letuce_2.png")
static var _3_texture = load("res://textures/items/letuce/letuce_3.png")
static var _4_texture = load("res://textures/items/letuce/letuce_4.png")
static var _5_texture = load("res://textures/items/letuce/letuce_5.png")
static var _texture = load("res://textures/items/letuce/letuce.png")


static var _name_stet_map = {
	PlantGrowthStage.SEED: "生菜种子",
	PlantGrowthStage.SPROUT: "生菜幼苗",
	PlantGrowthStage.YOUNG: "生菜",
	PlantGrowthStage.MATURE: "生菜",
	PlantGrowthStage.FLOWERING: "生菜",
	PlantGrowthStage.FRUITING: "生菜",
	PlantGrowthStage.WILTING: "生菜",
}

static var _texture_stet_map = {
	PlantGrowthStage.SEED: _seed_texture,
	PlantGrowthStage.SPROUT: _1_texture,
	PlantGrowthStage.YOUNG: _2_texture,
	PlantGrowthStage.MATURE: _3_texture,
	PlantGrowthStage.FLOWERING: _4_texture,
	PlantGrowthStage.FRUITING: _5_texture,
	PlantGrowthStage.WILTING: _texture,
}

func  _init(qualityLevel:int, state:PlantGrowthStage=PlantGrowthStage.SEED) -> void:
	super(_name_stet_map.get(state), qualityLevel, state)
	textur = _texture_stet_map.get(state)
	
func update_state(state:PlantGrowthStage):
	super(state)
	self.textur = _texture_stet_map.get(state)
	self.name = _name_stet_map.get(state)
	
func gather()->Array[Botany]:
	update_state(PlantGrowthStage.WILTING)
	
	if developmentalState > 100:
		return [
			Lettuce.new(4, PlantGrowthStage.WILTING), 
			Lettuce.new(4, PlantGrowthStage.WILTING),
			Lettuce.new(4),
			Lettuce.new(4)
			]
	elif developmentalState < 75:
		return [Lettuce.new(1)]
		
	else:
		return [
			Lettuce.new(3, PlantGrowthStage.WILTING), 
			Lettuce.new(3)
		]
	

func clone():
	return Lettuce.new(self.qualityLevel, self.state)
