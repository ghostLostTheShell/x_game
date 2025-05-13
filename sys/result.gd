class_name Result

var success: bool
var value
var error: String

func _init(success: bool, value = null, error: String = ""):
	self.success = success
	self.value = value
	self.error = error

static func Ok(value) -> Result:
	return Result.new(true, value)

static func Err(error: String) -> Result:
	return Result.new(false, null, error)
