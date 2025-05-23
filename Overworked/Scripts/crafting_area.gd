extends Area2D

@export var taken := false

@rpc("any_peer", "call_local", "reliable")
func interact(player_name) -> void:
	if is_multiplayer_authority():
		var player = get_node("../" + player_name)
		if !taken and player.carry_id == -1:
			player.open_crafting.rpc()
			taken = true

@rpc("any_peer", "call_local", "reliable")
func set_taken(_taken : bool):
	if is_multiplayer_authority():
		taken = _taken
