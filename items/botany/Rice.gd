"""
水稻
"""
extends Botany
class_name Rice

static var _seed_texture = load("res://textures/items/rice/水稻种子.png")
static var _1_texture = load("res://textures/items/rice/rice_1.png")
static var _2_texture = load("res://textures/items/rice/rice_2.png")
static var _3_texture = load("res://textures/items/rice/rice_3.png")
static var _4_texture = load("res://textures/items/rice/rice_4.png")
static var _5_texture = load("res://textures/items/rice/rice_5.png")
static var _texture = load("res://textures/items/rice/稻谷.png")


static var _name_stet_map = {
	PlantGrowthStage.SEED: "水稻种子",
	PlantGrowthStage.SPROUT: "水稻幼苗",
	PlantGrowthStage.YOUNG: "水稻",
	PlantGrowthStage.MATURE: "水稻",
	PlantGrowthStage.FLOWERING: "水稻",
	PlantGrowthStage.FRUITING: "水稻",
	PlantGrowthStage.WILTING: "水稻",
}

static var _texture_stet_map = {
	PlantGrowthStage.SEED: _seed_texture,
	PlantGrowthStage.SPROUT: _1_texture,
	PlantGrowthStage.YOUNG: _2_texture,
	PlantGrowthStage.MATURE: _3_texture,
	PlantGrowthStage.FLOWERING: _4_texture,
	PlantGrowthStage.FRUITING: _4_texture,
	PlantGrowthStage.WILTING: _texture,
}

func  _init(qualityLevel:int, stat:PlantGrowthStage=PlantGrowthStage.SEED) -> void:
	super(_name_stet_map.get(stat), qualityLevel)
	textur = _texture_stet_map.get(stat)

func update_state(state:PlantGrowthStage):
	super(state)
	self.textur = _texture_stet_map.get(state)
	self.name = _name_stet_map.get(state)

func gather():
	update_state(PlantGrowthStage.WILTING)
	return [self, Rice.new(2),  Rice.new(1)]
	
func clone():
	return Rice.new(self.qualityLevel, self.state)
