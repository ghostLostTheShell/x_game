extends Object
class_name AppData

static var seed_stock:Array[Seed] = [
	Seed.new("生菜种子", 0),
	Seed.new("生菜种子", 1),
	Seed.new("生菜种子", 2),
	Seed.new("生菜种子", 3),
	Seed.new("生菜种子", 3),
	Seed.new("生菜种子", 3),
]

static  var culture_medium_stock:Array[CultureMedium] = [
	CultureMedium.new("岩棉培养基", 0),
	CultureMedium.new("蛭石培养基", 1),
	CultureMedium.new("岩棉培养基", 2),
	CultureMedium.new("蛭石培养基", 3),
	CultureMedium.new("岩棉培养基", 3),
	CultureMedium.new("岩棉培养基", 3),
]

static func _init_seed_stock():
	#seed_stock.append(Seed.new("生菜种子", 5))
	#seed_stock.append(Seed.new("生菜种子", 2))
	#seed_stock.append(Seed.new("生菜种子", 3))
	#seed_stock.append(Seed.new("生菜种子", 4))
	#seed_stock.append(Seed.new("生菜种子", 1))
	pass
