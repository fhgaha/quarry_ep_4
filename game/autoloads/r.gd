@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRParking1 := preload("res://game/rooms/parking_1/room_parking_1.gd")
const PRTelephoneBooth := preload("res://game/rooms/telephone_booth/room_telephone_booth.gd")
const PRPoolFirst := preload("res://game/rooms/pool_first/room_pool_first.gd")
const PRMotelRoom := preload("res://game/rooms/motel_room/room_motel_room.gd")
const PRParkingSecond := preload("res://game/rooms/parking_second/room_parking_second.gd")
const PRTitles := preload("res://game/rooms/titles/room_titles.gd")
# ---- classes

# nodes ----
var Parking1: PRParking1 : get = get_Parking1
var TelephoneBooth: PRTelephoneBooth : get = get_TelephoneBooth
var PoolFirst: PRPoolFirst : get = get_PoolFirst
var MotelRoom: PRMotelRoom : get = get_MotelRoom
var ParkingSecond: PRParkingSecond : get = get_ParkingSecond
var Titles: PRTitles : get = get_Titles
# ---- nodes

# functions ----
func get_Parking1() -> PRParking1: return get_runtime_room("Parking1")
func get_TelephoneBooth() -> PRTelephoneBooth: return get_runtime_room("TelephoneBooth")
func get_PoolFirst() -> PRPoolFirst: return get_runtime_room("PoolFirst")
func get_MotelRoom() -> PRMotelRoom: return get_runtime_room("MotelRoom")
func get_ParkingSecond() -> PRParkingSecond: return get_runtime_room("ParkingSecond")
func get_Titles() -> PRTitles: return get_runtime_room("Titles")
# ---- functions

