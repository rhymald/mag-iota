module hp

import rand

fn test_heal_damage() {
	mut dummy := init_health()
	mut v := 4.0
	for x in 0..10 {
		d := rand.f64()-0.5
		v += rand.f64()
		dummy = dummy.consume_damage( d, v, x%3==1 )
		println('LVL: ${dummy.show_exp()}:\tHP ${dummy.show_rate()}')
	}
	dump(dummy)
}