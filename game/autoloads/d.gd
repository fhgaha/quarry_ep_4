@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDTelephoneBoothMainKarl := preload("res://game/dialogs/telephone_booth_main_karl/dialog_telephone_booth_main_karl.gd")
# ---- classes

# nodes ----
var TelephoneBoothMainKarl: PDTelephoneBoothMainKarl : get = get_TelephoneBoothMainKarl
# ---- nodes

# functions ----
func get_TelephoneBoothMainKarl() -> PDTelephoneBoothMainKarl: return get_instance("TelephoneBoothMainKarl")
# ---- functions

