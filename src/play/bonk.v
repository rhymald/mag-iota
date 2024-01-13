module play

import char
import math

fn do_bonk(caster char.Character, target char.Character) (char.Character, char.Character) {
	if caster.hp.show_rate() < 0 { return caster, target }
	mut bonked := target
	bonked.hp = bonked.hp.consume_damage( 1-math.sqrt(caster.power+1), target.vitality, false )
	return caster, bonked
}