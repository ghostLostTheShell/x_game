extends Node

@onready var music_player = $AudioStreamPlayer
@onready var buttonAudioPlayer = $ButtonAudioPlayer

func _ready() -> void:
	play_music(preload("res://Music/bg.mp3"))


func play_music(track: AudioStream):
	music_player.stream = track
	music_player.play()


func stop_music():
	music_player.stop()


func _on_audio_stream_player_finished() -> void:
	music_player.play() 
