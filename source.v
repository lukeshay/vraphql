module source

interface Location {
	line int
	column int
}

pub struct Source {
	body            string
	name            string
	location_offset Location
}
