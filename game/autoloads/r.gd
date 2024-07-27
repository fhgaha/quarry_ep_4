@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRParking1 := preload("res://game/rooms/parking_1/room_parking_1.gd")
const PRTelephoneBooth := preload("res://game/rooms/telephone_booth/room_telephone_booth.gd")
const PRPoolFirst := preload("res://game/rooms/pool_first/room_pool_first.gd")
# ---- classes

# nodes ----
var Parking1: PRParking1 : get = get_Parking1
var TelephoneBooth: PRTelephoneBooth : get = get_TelephoneBooth
var PoolFirst: PRPoolFirst : get = get_PoolFirst
# ---- nodes

# functions ----
func get_Parking1() -> PRParking1: return get_runtime_room("Parking1")
func get_TelephoneBooth() -> PRTelephoneBooth: return get_runtime_room("TelephoneBooth")
func get_PoolFirst() -> PRPoolFirst: return get_runtime_room("PoolFirst")
# ---- functions

