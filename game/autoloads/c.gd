@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMainBooth := preload("res://game/characters/main_booth/character_main_booth.gd")
const PCMainParking1 := preload("res://game/characters/main_parking_1/character_main_parking_1.gd")
# ---- classes

# nodes ----
var MainBooth: PCMainBooth : get = get_MainBooth
var MainParking1: PCMainParking1 : get = get_MainParking1
# ---- nodes

# functions ----
func get_MainBooth() -> PCMainBooth: return get_runtime_character("MainBooth")
func get_MainParking1() -> PCMainParking1: return get_runtime_character("MainParking1")
# ---- functions

