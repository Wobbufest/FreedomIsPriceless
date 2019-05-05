extends Node2D

onready var BackButton = self.get_node("Main Container/Back Button")
onready var BonusEndingButton = self.get_node("Main Container/Bonus Ending Button")

func _ready():
	
	BackButton.connect("pressed", self, "Back")
	BonusEndingButton.connect("pressed", self, "BonusEnding")
	
	pass
	
func BonusEndingHandler():
	
	if(Globals.EndingA && Globals.EndingB && Globals.EndingC):
		
		self.BonusEndingButton.disabled = false
		self.BonusEndingButton.visible = true
		
	else:
		
		self.BonusEndingButton.disabled = true
		self.BonusEndingButton.visible = false
	
	pass
	
func BonusEnding():
	
	self.get_tree().change_scene("res://Scenes/Bonus Ending.tscn")
	
	pass
	
func Back():
	
	self.get_tree().change_scene("res://Scenes/Main Menu.tscn")
	
	pass
	
func _process(delta):
	
	BonusEndingHandler()
	
	pass