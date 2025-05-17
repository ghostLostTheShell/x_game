"""
萝卜
"""
extends Botany
class_name Radish

static var _seed_texture = load("res://textures/items/radish/萝卜种子.png")
static var _1_texture = load("res://textures/items/radish/radish_1.png")
static var _2_texture = load("res://textures/items/radish/radish_2.png")
static var _3_texture = load("res://textures/items/radish/radish_3.png")
static var _4_texture = load("res://textures/items/radish/radish_4.png")
static var _5_texture = load("res://textures/items/radish/radish_5.png")
static var _texture = load("res://textures/items/radish/radish.png")


static var _name_stet_map = {
	PlantGrowthStage.SEED: "萝卜种子",
	PlantGrowthStage.SPROUT: "萝卜幼苗",
	PlantGrowthStage.YOUNG: "萝卜",
	PlantGrowthStage.MATURE: "萝卜",
	PlantGrowthStage.FLOWERING: "萝卜",
	PlantGrowthStage.FRUITING: "萝卜",
	PlantGrowthStage.WILTING: "萝卜",
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

func gather():
	update_state(PlantGrowthStage.WILTING)
	if developmentalState > 100:
		return [
			Radish.new(4, PlantGrowthStage.WILTING), 
			Radish.new(4, PlantGrowthStage.WILTING),
			Radish.new(4),
			Radish.new(4)
			]
	elif developmentalState < 75:
		return [Radish.new(1), Radish.new(4, PlantGrowthStage.WILTING)]
		
	else:
		return [
			Radish.new(3, PlantGrowthStage.WILTING), 
			Radish.new(3)
		]

func clone():
	return Radish.new(self.qualityLevel, self.state)
