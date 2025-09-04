class_name PauseMenu
extends VBoxContainer

@onready var resume_btn: Button = $ResumeBtn
@onready var exit_btn: Button = $ExitBtn

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_resume_btn_pressed():
	EventBus.game_paused.emit(false)
	get_tree().paused = false
	hide()
