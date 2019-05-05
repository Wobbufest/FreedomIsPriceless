extends Node2D

onready var BackButton = self.get_node("Main Container/Back Button")

func _ready():
	
	BackButton.connect("pressed", self, "Back")
	
	pass
	
func Back():
	
	self.get_tree().change_scene("res://Scenes/Main Menu.tscn")
	
	pass