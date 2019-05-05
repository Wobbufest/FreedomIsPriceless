extends StaticBody

export var Target:NodePath

onready var TriggerArea = self.get_node("Area")
onready var AnimPlayer = self.get_node("AnimationPlayer")

onready var Pressed = false

func ActivateTarget():
	
	if(get_node(Target).has_method("Open")):
		
		get_node(Target).Open()
	
	pass
	
func DeactivateTarget():
	
	if(get_node(Target).has_method("Close")):
		
		get_node(Target).Close()
	
	pass

func SetPressed():
	
	if(!Pressed):
		
		Pressed = true
	
	pass
	
func SetReleased():
	
	if(Pressed):
		
		Pressed = false
	
	pass

func PressedHandler():
	
	for Overlapper in TriggerArea.get_overlapping_bodies():
		
		if(Overlapper.is_in_group("Player") && !Pressed):
			
			AnimPlayer.play("Pressed")
			
	if(TriggerArea.get_overlapping_bodies().size() <= 0):
		
		if(Pressed):
			
			AnimPlayer.play("Released")
	
	pass

func _ready():
	
	
	
	pass
	
func _process(delta):
	
	PressedHandler()
	
	pass