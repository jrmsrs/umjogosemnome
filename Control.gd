extends Control

func _ready():
	get_node("VBoxContainer").get_node("Button").grab_focus()

func _on_Button2_pressed():
	get_tree().quit()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_LinkButton_pressed():
	OS.shell_open("https://github.com/jrmsrs")
