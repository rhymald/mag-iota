module health

import math

struct Health {
	plus    int
	minus   int
	plus_c  int
	minus_c int
	dmg_in    f64
	heal_self f64
	heal_in   f64
	dmg_self  f64
}

fn init_health() Health { return Health{ plus: 618 }}

fn (hp Health) do_damage(dmg f64, vitality f64, self bool) Health {
	if hp.plus - hp.minus <= 0 { return Health{} }
	if hp.plus - hp.minus >= 1000 && dmg > 0 { return hp }
	mut damage := dmg
	if math.abs(dmg) > vitality { damage = vitality * math.abs(dmg)/dmg }
	mut plus := 0.0  ; mut heal := 0 ; mut hamount := 0.0
	mut minus := 0.0 ; mut hurt := 0 ; mut damount := 0.0
	mut self_a := 0  ; mut in_a := 0
	if damage > 0 { plus = math.ceil(1000*damage/vitality)  ; heal = 1 ; hamount = dmg }
	if damage < 0 { minus = math.ceil(1000*damage/vitality) ; hurt = 1 ; damount = dmg }
	if self { self_a = 1 } else { in_a = 1 }
	return Health{
		plus:      hp.plus      + int(plus),      minus:    hp.minus    - int(minus),
		plus_c:    hp.plus_c    + heal,           minus_c:  hp.minus_c  + hurt,
		heal_in:   math.ceil((hp.heal_in   + hamount*in_a) * 1000 ) / 1000,   dmg_in:   math.ceil((hp.dmg_in   - damount*in_a) * 1000 ) / 1000,
		heal_self: math.ceil((hp.heal_self + hamount*self_a) * 1000 ) / 1000, dmg_self: math.ceil((hp.dmg_self - damount*self_a) * 1000 ) / 1000,
	}
}

fn (hp Health) show_exp() f64 {
	mut exp := 1.0
	if hp.heal_in - hp.dmg_self > 0 { exp += hp.heal_in - hp.dmg_self }
	if hp.dmg_in - hp.heal_self > 0 { exp += hp.dmg_in - hp.heal_self }
	foundation := 1 + f64(hp.minus_c + 1) / f64(hp.plus_c + 1)
	return math.ceil(( math.log( exp ) / math.log(foundation) )*1000)/1000
}

fn (hp Health) show_rate() f64 { return f64( hp.plus - hp.minus )/1000 }
