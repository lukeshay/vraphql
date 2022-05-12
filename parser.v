module parser

import source { Source }
import ast { DefinitionNode, DocumentNode }

type StringOrSource = Source | string

struct Parser {
	source StringOrSource
}

fn (parser Parser) parse_document() DocumentNode {
	return DocumentNode{
		definitions: []DefinitionNode{}
	}
}

pub fn parse(source StringOrSource) DocumentNode {
	return Parser{source}.parse_document()
}
