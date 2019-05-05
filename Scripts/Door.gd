extends Spatial

onready var AnimPlayer = self.get_node("AnimationPlayer")
onready var Open = false

func Open():
	
	if(!Open):
		
		AnimPlayer.play("Open")
		Open = true
	
	pass
	
func Close():
	
	if(Open):
		
		AnimPlayer.play("Close")
		Open = false
	
	pass

func _ready():
	
	
	
	pass