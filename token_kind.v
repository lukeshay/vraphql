module token_kind

/**
 * An exported enum describing the different kinds of tokens that the
 * lexer emits.
*/
pub enum TokenKind {
	sof
	eof
	bang
	dollar
	amp
	paren_l
	paren_r
	spread
	colon
	equals
	at
	bracket_l
	bracket_r
	brace_l
	pipe
	brace_r
	name
	int
	float
	string
	block_string
	comment
}

pub fn (t TokenKind) value() string {
	match t {
		.sof {
			return '<SOF>'
		}
		.eof {
			return '<EOF>'
		}
		.bang {
			return '!'
		}
		.dollar {
			return '$'
		}
		.amp {
			return '&'
		}
		.paren_l {
			return '('
		}
		.paren_r {
			return ')'
		}
		.spread {
			return '...'
		}
		.colon {
			return ':'
		}
		.equals {
			return '='
		}
		.at {
			return '@'
		}
		.bracket_l {
			return '['
		}
		.bracket_r {
			return ']'
		}
		.brace_l {
			return '{'
		}
		.pipe {
			return '|'
		}
		.brace_r {
			return '}'
		}
		.name {
			return 'Name'
		}
		.int {
			return 'Int'
		}
		.float {
			return 'Float'
		}
		.string {
			return 'String'
		}
		.block_string {
			return 'BlockString'
		}
		.comment {
			return 'Comment'
		}
	}
}
