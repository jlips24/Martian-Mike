extends Node

var sfx_volume = -15.0

var hurt = preload("res://assets/audio/hurt.wav")
var jump = preload("res://assets/audio/jump.wav")

func play_sfx(sfx_name: String):
	var stream = null
	if sfx_name == "hurt":
		stream = hurt
	elif sfx_name == "jump":
		stream = jump
	else:
		print("Invalid SFX name")
		return
	
	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	asp.volume_db = sfx_volume
	
	add_child(asp)
	asp.play()
	await asp.finished
	asp.queue_free()

func get_music_volume():
	return $MusicPlayer.volume_db

func set_music_volume(value: float):
	$MusicPlayer.volume_db = value

func get_sfx_volume():
	return sfx_volume

func set_sfx_volume(value: float):
	sfx_volume = value
