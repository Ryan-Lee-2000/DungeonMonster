extends Node

class_name Species

var species_name: String
#Growth rates
var g_life: float
var g_pow: float
var g_intel: float
var g_skill: float
var g_def: float
var g_spd: float

var species_dict = {
	"Skeleton": ["Skeleton",1.0, 0.8, 0.8, 1.2, 0.5, 1.5],
	"Goblin": ["Goblin",0.8, 0.8, 1, 1.5, 0.4, 1.2]
}

func get_species(s_name: String):
	return species_dict[s_name]

func display_species(s_name: String):
	prints(species_dict[s_name])
	return
