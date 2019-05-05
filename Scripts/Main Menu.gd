extends Node2D

onready var PlayButton = self.get_node("Main Container/Buttons Container/Play Button")
onready var CreditsButton = self.get_node("Main Container/Buttons Container/Credits Button")
onready var ControlsButton = self.get_node("Main Container/Buttons Container/Controls Button")
onready var ExitButton = self.get_node("Main Container/Buttons Container/Exit Button")

onready var MainScene = "res://Scenes/Main.tscn"
onready var CreditsScene = "res://Scenes/Credits.tscn"
onready var ControlsScene = "res://Scenes/Controls.tscn"

func _ready():
	
	PlayButton.connect("pressed", self, "PlayGame")
	CreditsButton.connect("pressed", self, "Credits")
	ControlsButton.connect("pressed", self, "Controls")
	ExitButton.connect("pressed", self, "ExitGame")
	
	pass
	
func PlayGame():
	
	self.get_tree().change_scene(MainScene)
	
	pass
	
func Credits():
	
	self.get_tree().change_scene(CreditsScene)
	
	pass
	
func Controls():
	
	self.get_tree().change_scene(ControlsScene)
	
	pass
	
func ExitGame():
	
	self.get_tree().quit()
	
	pass