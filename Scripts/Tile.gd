extends StaticBody

onready var AnimPlayer = self.get_node("AnimationPlayer")
onready var Dead = false

func _ready():
	
	
	
	pass
	
func CrumblingHandler():
	
	for Collider in self.get_node("Area").get_overlapping_bodies():
		
		if(Collider.is_in_group("Player")):
			
			if(!Dead):
				
				Dead = true
				Crumble()
	
	pass
	
func Crumble():
	
	AnimPlayer.play("Crumble")
	
	pass
	
func Fall():
	
	AnimPlayer.play("Fall")
	
	pass
	
func Die():
	
	self.get_parent().remove_child(self)
	self.queue_free()
	
	pass
	
func _process(delta):
	
	CrumblingHandler()
	
	pass