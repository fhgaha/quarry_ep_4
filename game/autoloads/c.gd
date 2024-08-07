@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMainBooth := preload("res://game/characters/main_booth/character_main_booth.gd")
const PCMainParking1 := preload("res://game/characters/main_parking_1/character_main_parking_1.gd")
const PCMainNaked := preload("res://game/characters/main_naked/character_main_naked.gd")
const PCHarlow := preload("res://game/characters/harlow/character_harlow.gd")
const PCJoni := preload("res://game/characters/joni/character_joni.gd")
const PCMainHotelRoom := preload("res://game/characters/main_hotel_room/character_main_hotel_room.gd")
const PCWhiteText := preload("res://game/characters/white_text/character_white_text.gd")
# ---- classes

# nodes ----
var MainBooth: PCMainBooth : get = get_MainBooth
var MainParking1: PCMainParking1 : get = get_MainParking1
var MainNaked: PCMainNaked : get = get_MainNaked
var Harlow: PCHarlow : get = get_Harlow
var Joni: PCJoni : get = get_Joni
var MainHotelRoom: PCMainHotelRoom : get = get_MainHotelRoom
var WhiteText: PCWhiteText : get = get_WhiteText
# ---- nodes

# functions ----
func get_MainBooth() -> PCMainBooth: return get_runtime_character("MainBooth")
func get_MainParking1() -> PCMainParking1: return get_runtime_character("MainParking1")
func get_MainNaked() -> PCMainNaked: return get_runtime_character("MainNaked")
func get_Harlow() -> PCHarlow: return get_runtime_character("Harlow")
func get_Joni() -> PCJoni: return get_runtime_character("Joni")
func get_MainHotelRoom() -> PCMainHotelRoom: return get_runtime_character("MainHotelRoom")
func get_WhiteText() -> PCWhiteText: return get_runtime_character("WhiteText")
# ---- functions

