module play

import char

fn test_chars_do_bonks() {
	mut one := char.init_character('one')
	mut two := char.init_character('two')
	for _ in 0..32 {
		one, two = do_bonk(one, two)
		println('LVL:${one.hp.show_exp()}\tat [${one.hp.show_rate()}]HP\t| >>> vs >>> |\tLVL:${two.hp.show_exp()}\tat [${two.hp.show_rate()}]HP')
		two, one = do_bonk(two, one)
		println('LVL:${one.hp.show_exp()}\tat [${one.hp.show_rate()}]HP\t| <<< vs <<< |\tLVL:${two.hp.show_exp()}\tat [${two.hp.show_rate()}]HP')
	}
}