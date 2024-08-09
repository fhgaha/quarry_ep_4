@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDTelephoneBoothMainKarl := preload("res://game/dialogs/telephone_booth_main_karl/dialog_telephone_booth_main_karl.gd")
const PDPoolMacHarlowFirst := preload("res://game/dialogs/pool_mac_harlow_first/dialog_pool_mac_harlow_first.gd")
const PDMacJoniHotelRoomFirst := preload("res://game/dialogs/mac_joni_hotel_room_first/dialog_mac_joni_hotel_room_first.gd")
const PDMacJoniHotelRoomSecond := preload("res://game/dialogs/mac_joni_hotel_room_second/dialog_mac_joni_hotel_room_second.gd")
const PDMacJoniParking := preload("res://game/dialogs/mac_joni_parking/dialog_mac_joni_parking.gd")
# ---- classes

# nodes ----
var TelephoneBoothMainKarl: PDTelephoneBoothMainKarl : get = get_TelephoneBoothMainKarl
var PoolMacHarlowFirst: PDPoolMacHarlowFirst : get = get_PoolMacHarlowFirst
var MacJoniHotelRoomFirst: PDMacJoniHotelRoomFirst : get = get_MacJoniHotelRoomFirst
var MacJoniHotelRoomSecond: PDMacJoniHotelRoomSecond : get = get_MacJoniHotelRoomSecond
var MacJoniParking: PDMacJoniParking : get = get_MacJoniParking
# ---- nodes

# functions ----
func get_TelephoneBoothMainKarl() -> PDTelephoneBoothMainKarl: return get_instance("TelephoneBoothMainKarl")
func get_PoolMacHarlowFirst() -> PDPoolMacHarlowFirst: return get_instance("PoolMacHarlowFirst")
func get_MacJoniHotelRoomFirst() -> PDMacJoniHotelRoomFirst: return get_instance("MacJoniHotelRoomFirst")
func get_MacJoniHotelRoomSecond() -> PDMacJoniHotelRoomSecond: return get_instance("MacJoniHotelRoomSecond")
func get_MacJoniParking() -> PDMacJoniParking: return get_instance("MacJoniParking")
# ---- functions

