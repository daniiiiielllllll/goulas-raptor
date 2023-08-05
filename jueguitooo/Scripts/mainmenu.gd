extends Control


func _ready():
	var main_menu_button = preload("res://MainMenuButton.tscn")
	var buttons = ["Nueva partida"]
	
	for i in range(buttons.size()):
		var instance = main_menu_button.instance()
		instance.text = buttons[i]
		match i:
			0:
				instance.connect("pressed", self,"load_scene", ["res://New Game.tscn"])
		$CenterContainer/PanelContainer/VBoxContainer/Buttons.add_child(instance)

func load_scene(scene: String) -> void:
	var error_code = get_tree().change_scene(scene)
	if error_code != 0:
		print("Error: ", error_code)

func quit () -> void:
	get_tree().quit()
