extends Node

class_name Stats

var nickname: String
var species: Array
var bp: int
var life: int
var power: int
var intel: int
var skill: int
var def: int
var spd: int
var abi: Array

func init_testing_creature(species_name: String):
	nickname = species_name
	species = Species.new().get_species(species_name)
	life = 100 * species[1]
	power = 100 * species[2]
	intel = 100 * species[3]
	skill = 100 * species[4]
	def = 100 * species[5]
	spd = 100 * species[6]
	abi = []
	pass

func display_stats():
	var result = "Nickname: " + str(nickname) + "\n"
	result += "Species: " + str(species[0]) + "\n"
	result += "Life: " + str(life) + "\n"
	result += "Power: " + str(power) + "\n"
	result += "Intel: " + str(intel) + "\n"
	result += "Skill: " + str(skill) + "\n"
	result += "Def: " + str(def) + "\n"
	result += "Spd: " + str(spd) + "\n"
	result += "abi: " + str(abi)
	
	return result
