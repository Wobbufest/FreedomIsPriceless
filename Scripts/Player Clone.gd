extends KinematicBody

onready var AnimPlayer = self.get_node("AnimationPlayer")

onready var Player = null

onready var TimeAlive = 5

func LifeHandler(delta):
	
	if(TimeAlive > 0):
		
		TimeAlive -= delta
		
	if(TimeAlive <= 0):
		
		StartDeath()
	
	pass
	
func StartDeath():
	
	AnimPlayer.play("Teleport Start")
	
	pass
	
func Die():
	
	if(Player.has_method("AddCloneCount")):
		
		Player.AddCloneCount()
	
	self.get_parent().remove_child(self)
	self.queue_free()
	
	pass

func _ready():
	
	AnimPlayer.play("Idle")
	
	pass
	
func _process(delta):
	
	LifeHandler(delta)
	
	pass