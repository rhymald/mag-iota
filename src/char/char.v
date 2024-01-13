module char

import hp
import rand

pub struct Character {
	name string
pub:
	power    f64
	vitality f64
pub mut:
	hp hp.Health
}

fn init_character(name string) Character {
	luck := rand.f64()*5+2
	return Character{
		name: name,
		hp: hp.init_health(),
		power: 7-luck
		vitality: luck 
	}
}