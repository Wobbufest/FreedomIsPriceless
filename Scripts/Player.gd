extends KinematicBody

onready var UpPressed = false
onready var DownPressed = false
onready var LeftPressed = false
onready var RightPressed = false
onready var SpacePressed = false
onready var ShiftPressed = false

onready var UpPressing = false
onready var DownPressing = false
onready var LeftPressing = false
onready var RightPressing = false
onready var SpacePressing = false
onready var ShiftPressing = false

onready var Thrust = 5
onready var XAccel = 0
onready var ZAccel = 0
onready var AccelIncrement = 0.1
onready var AccelMultiplier = 1
onready var XSpeed = 0
onready var ZSpeed = 0

onready var TeleportX = 0
onready var TeleportZ = 0
onready var Teleporting = false
onready var TeleportTime = 0
const TeleportCap = 1

onready var CloneCount = 0
const CloneLimit = 1

onready var AnimPlayer = self.get_node("AnimationPlayer")

func SubtractCloneCount():
	
	if(CloneCount < CloneLimit):
		
		CloneCount += 1
	
	pass
	
func AddCloneCount():
	
	if(CloneCount > 0):
		
		CloneCount -= 1
	
	pass
	
func CloneHandler():
	
	if(CloneCount < CloneLimit && ShiftPressed && !ShiftPressing):
		
		SubtractCloneCount()
		AddClone()
	
	pass
	
func AddClone():
	
	var CloneResource = preload("res://Scenes/Player Clone.tscn")
	var Clone = CloneResource.instance()
	self.get_parent().add_child(Clone)
	Clone.set_translation(self.translation)
	Clone.Player = self
	
	pass

func _ready():
	
	AnimPlayer.play("Idle")
	set_process_input(true)
	set_physics_process(true)
	
	pass
	
func _physics_process(delta):
	
	MovementHandler()
	
	pass

func _input(Key):
	
	if(Key is InputEventKey):
		
		if(Key.scancode == KEY_UP && Key.is_pressed()):
			
			UpPressed = true
			
		if(Key.scancode == KEY_DOWN && Key.is_pressed()):
			
			DownPressed = true
			
		if(Key.scancode == KEY_LEFT && Key.is_pressed()):
			
			LeftPressed = true
			
		if(Key.scancode == KEY_RIGHT && Key.is_pressed()):
			
			RightPressed = true
			
		if(Key.scancode == KEY_SPACE && Key.is_pressed()):
			
			SpacePressed = true
			
		if(Key.scancode == KEY_SHIFT && Key.is_pressed()):
			
			ShiftPressed = true
			
		if(Key.scancode == KEY_UP && !Key.is_pressed()):
			
			UpPressed = false
			UpPressing = false
			
		if(Key.scancode == KEY_DOWN && !Key.is_pressed()):
			
			DownPressed = false
			DownPressing = false
			
		if(Key.scancode == KEY_LEFT && !Key.is_pressed()):
			
			LeftPressed = false
			LeftPressing = false
			
		if(Key.scancode == KEY_RIGHT && !Key.is_pressed()):
			
			RightPressed = false
			RightPressing = false
			
		if(Key.scancode == KEY_SPACE && !Key.is_pressed()):
			
			SpacePressed = false
			SpacePressing = false
			
		if(Key.scancode == KEY_SHIFT && !Key.is_pressed()):
			
			ShiftPressed = false
			ShiftPressing = false
		
		pass
	
	pass
	
func HoldingKeyHandler():
	
	if(UpPressed && !UpPressing):
		
		UpPressing = true
		
	if(DownPressed && !DownPressing):
		
		DownPressing = true
		
	if(LeftPressed && !LeftPressing):
		
		LeftPressing = true
		
	if(RightPressed && !RightPressing):
		
		RightPressing = true
		
	if(SpacePressed && !SpacePressing):
		
		SpacePressing = true
		
	if(ShiftPressed && !ShiftPressing):
		
		ShiftPressing = true
	
	pass
	
func AccelerationHandler():
	
	if(!LeftPressed && !RightPressed):
		
		if(XAccel < 0):
			
			XAccel += AccelIncrement
			
		elif(XAccel > 0):
			
			XAccel -= AccelIncrement
			
		if(XAccel < 0 && XAccel > -AccelIncrement):
			
			XAccel = 0
			
		if(XAccel > 0 && XAccel < AccelIncrement):
			
			XAccel = 0
			
	if(LeftPressed || RightPressed):
		
		if(LeftPressed):
			
			if(XAccel > 0):
				
				XAccel -= AccelIncrement * 2
				
			if(XAccel <= 0):
				
				XAccel -= AccelIncrement
				
			if(XAccel <= -1):
				
				XAccel = -1
				
		if(RightPressed):
			
			if(XAccel < 0):
				
				XAccel += AccelIncrement * 2
				
			if(XAccel >= 0):
				
				XAccel += AccelIncrement
				
			if(XAccel >= 1):
				
				XAccel = 1
				
		if(LeftPressed && RightPressed):
			
			if(XAccel < 0):
				
				XAccel += AccelIncrement * 2
				
			elif(XAccel > 0):
				
				XAccel -= AccelIncrement * 2
				
			else:
				
				XAccel = 0
				
	if(!UpPressed && !DownPressed):
		
		if(ZAccel < 0):
			
			ZAccel += AccelIncrement
			
		elif(ZAccel > 0):
			
			ZAccel -= AccelIncrement
			
		if(ZAccel < 0 && ZAccel > -AccelIncrement):
			
			ZAccel = 0
			
		if(ZAccel > 0 && ZAccel < AccelIncrement):
			
			ZAccel = 0
			
	if(UpPressed || DownPressed):
		
		if(UpPressed):
			
			if(ZAccel > 0):
				
				ZAccel -= AccelIncrement * 2
				
			if(ZAccel <= 0):
				
				ZAccel -= AccelIncrement
				
			if(ZAccel <= -1):
				
				ZAccel = -1
				
		if(DownPressed):
			
			if(ZAccel < 0):
				
				ZAccel += AccelIncrement * 2
				
			if(ZAccel >= 0):
				
				ZAccel += AccelIncrement
				
			if(ZAccel >= 1):
				
				ZAccel = 1
				
		if(UpPressed && DownPressed):
			
			if(ZAccel < 0):
				
				ZAccel += AccelIncrement * 2
				
			elif(ZAccel > 0):
				
				ZAccel -= AccelIncrement * 2
				
			if(ZAccel < 0 && ZAccel > -AccelIncrement):
				
				ZAccel = 0
				
			if(ZAccel > 0 && ZAccel < AccelIncrement):
				
				ZAccel = 0
	
	XSpeed = Thrust * XAccel
	ZSpeed = Thrust * ZAccel
	
	pass
	
func TeleportHandler():
	
	if(SpacePressed && !SpacePressing && !Teleporting):
		
		Teleporting = true
		TeleportTime = TeleportCap
		TeleportX = XSpeed
		TeleportZ = ZSpeed
		AnimPlayer.play("Teleport Start")
	
	pass
	
func Teleport(delta):
	
	if(Teleporting):
		
		self.move_and_slide(self.transform.basis.x * (TeleportX * (150 * delta)), Vector3(0, 1, 0))
		self.move_and_slide(self.transform.basis.z * (TeleportZ * (150 * delta)), Vector3(0, 1, 0))
		TeleportTime -= delta * TeleportCap
		
		if(TeleportTime <= 0):
			
			TeleportTime = 0
			Teleporting = false
			AnimPlayer.play("Teleport Finish")
	
	pass
	
func PlayIdle():
	
	AnimPlayer.play("Idle")
	
	pass
	
func MovementHandler():
	
	if(!Teleporting):
		
		self.move_and_slide(self.transform.basis.x * XSpeed, Vector3(0, 1, 0))
		self.move_and_slide(self.transform.basis.z * ZSpeed, Vector3(0, 1, 0))
	
	if(!Teleporting):
		
		self.move_and_slide(self.transform.basis.y * -10, Vector3(0, 1, 0))
	
	pass
	
func _process(delta):
	
	TeleportHandler()
	Teleport(delta)
	AccelerationHandler()
	CloneHandler()
	
	HoldingKeyHandler()
	
	pass