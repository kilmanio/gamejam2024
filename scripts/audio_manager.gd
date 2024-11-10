extends Control

var audio_players = []

func play_audio(audio_file:Resource, volume:float=0.0, random_pitch:bool=true, pitch:float=1.0):
	var asp = AudioStreamPlayer.new()
	asp.bus = &"SFX"
	audio_players.append(asp)
	add_child(asp)
	asp.stream = audio_file
	asp.volume_db = volume
	if random_pitch:
		asp.pitch_scale = randf_range(0.8, 1.3)
	else:
		asp.pitch_scale = pitch
	asp.play()
	clear_audio_streams()
	
func clear_audio_streams():
	if audio_players.size() > 2:
		audio_players[0].queue_free()
		audio_players.remove_at(0)
