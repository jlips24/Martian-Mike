extends CanvasLayer

signal unpause

func show_win_screen(flag: bool):
	$WinScreen.visible = flag

func show_settings_screen(flag:bool):
	$Settings.visible = flag

func _on_settings_hide_settings():
	show_settings_screen(false)
	unpause.emit()
