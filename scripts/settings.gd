extends Control

@onready var music_slider = $MusicVolume/MusicVolumeHSlider
@onready var music_label = $MusicVolume/MusicVolumeLabel
@onready var sfx_slider = $SFXVolume/SFXVolumeHSlider
@onready var sfx_label = $SFXVolume/SFXVolumeLabel

signal hide_settings

func _ready():
	var music_volume = AudioPlayer.get_music_volume()
	var sfx_volume = AudioPlayer.get_sfx_volume()
	
	music_slider.value = db_to_percent(music_volume)
	music_label.text = str(int(db_to_percent(music_volume)))
	
	sfx_slider.value = db_to_percent(sfx_volume)
	sfx_label.text = str(int(db_to_percent(sfx_volume)))

func db_to_percent(db: float):
	return ((db + 60) / 60) * 100

func percent_to_db(percent: float):
	return (((percent / 100) * 60) - 60)

func _on_music_volume_h_slider_drag_ended(value_changed):
	AudioPlayer.set_music_volume(percent_to_db(music_slider.value))
	music_label.text = str(music_slider.value)

func _on_sfx_volume_h_slider_drag_ended(value_changed):
	AudioPlayer.set_sfx_volume(percent_to_db(sfx_slider.value))
	sfx_label.text = str(sfx_slider.value)
	AudioPlayer.play_sfx("jump")

func _on_resume_button_pressed():
	hide_settings.emit()

func _on_quit_button_pressed():
	get_tree().quit()
