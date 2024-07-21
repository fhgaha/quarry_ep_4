@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMainBooth := preload("res://game/characters/main_booth/character_main_booth.gd")
# ---- classes

# nodes ----
var MainBooth: PCMainBooth : get = get_MainBooth
# ---- nodes

# functions ----
func get_MainBooth() -> PCMainBooth: return get_runtime_character("MainBooth")
# ---- functions

