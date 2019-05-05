extends Spatial


func _ready():
	
	self.get_node("AnimationPlayer").play("Lit Loop")
	
	pass