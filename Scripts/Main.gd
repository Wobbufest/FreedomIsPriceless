extends Spatial

func _ready():
	
	
	
	pass
	
func PlayerDeathHandler():
	
	for Overlapper in self.get_node("Game Over Collision").get_overlapping_bodies():
		
			if Overlapper.is_in_group("Player"):
				
				self.get_tree().change_scene("res://Scenes/Game Over.tscn")
	
	pass
	
func EndingHandler():
	
	for Overlapper in self.get_node("End A Collision").get_overlapping_bodies():
		
		if(Overlapper.is_in_group("Player")):
			
			Globals.EndingA = true
			self.get_tree().change_scene("res://Scenes/Ending A.tscn")
			
	for Overlapper in self.get_node("End B Collision").get_overlapping_bodies():
		
		if(Overlapper.is_in_group("Player")):
			
			Globals.EndingB = true
			self.get_tree().change_scene("res://Scenes/Ending B.tscn")
			
	for Overlapper in self.get_node("End C Collision").get_overlapping_bodies():
		
		if(Overlapper.is_in_group("Player")):
			
			Globals.EndingC = true
			self.get_tree().change_scene("res://Scenes/Ending C.tscn")
	
	pass
	
func _process(delta):
	
	PlayerDeathHandler()
	EndingHandler()
	
	pass