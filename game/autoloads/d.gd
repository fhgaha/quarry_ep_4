@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDTelephoneBoothMainKarl := preload("res://game/dialogs/telephone_booth_main_karl/dialog_telephone_booth_main_karl.gd")
const PDPoolMacHarlowFirst := preload("res://game/dialogs/pool_mac_harlow_first/dialog_pool_mac_harlow_first.gd")
# ---- classes

# nodes ----
var TelephoneBoothMainKarl: PDTelephoneBoothMainKarl : get = get_TelephoneBoothMainKarl
var PoolMacHarlowFirst: PDPoolMacHarlowFirst : get = get_PoolMacHarlowFirst
# ---- nodes

# functions ----
func get_TelephoneBoothMainKarl() -> PDTelephoneBoothMainKarl: return get_instance("TelephoneBoothMainKarl")
func get_PoolMacHarlowFirst() -> PDPoolMacHarlowFirst: return get_instance("PoolMacHarlowFirst")
# ---- functions

