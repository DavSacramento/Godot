extends Area2D

@onready var timer: Timer = $Timer
@onready var deathscreen: CanvasLayer = $Deathscreen
@onready var color_rect: ColorRect = $Deathscreen/ColorRect

func _on_body_entered(body: Node2D) -> void:
	color_rect.visible = true
	timer.start()
	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
