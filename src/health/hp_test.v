module health

import rand

fn test_heal_damage() {
	mut dummy := init_health()
	mut v := 4.0
	for x in 0..37 {
		d := rand.f64()-0.5
		v += rand.f64()
		dummy = dummy.do_damage( d, v, x%3==1 )
		println('LVL: ${dummy.show_exp()}:\tHP ${dummy.show_rate()}')
	}
	println('')
	dump(dummy)
}