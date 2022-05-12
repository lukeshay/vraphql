module ast

import source { Source }
import kinds { Kind }
import token_kind { TokenKind }

/**
 * Contains a range of UTF-8 character offsets and token references that
 * identify the region of the source from which the AST derived.
*/
pub struct Location {
	/**
   * The character offset at which this Node begins.
	*/
	start int
	/**
   * The character offset at which this Node ends.
	*/
	end int
	/**
   * The Token at which this Node begins.
	*/
	start_token Token
	/**
   * The Token at which this Node ends.
	*/
	end_token Token
	/**
   * The Source document the AST represents.
	*/
	source Source
	// constructor(start_token Token, end_token Token, source Source) {
	//   this.start = start_token.start
	//   this.end = end_token.end
	//   this.start_token = start_token
	//   this.end_token = end_token
	//   this.source = source
	// }
	// get [Symbol.toStringTag]() {
	//   return 'Location'
	// }
	// toJSON() { start int end int } {
	//   return { start this.start, end this.end }
	// }
}

pub struct Empty {}

/**
 * Represents a range of characters represented by a lexical token
 * within a Source.
*/
pub struct Token {
	/**
   * The kind of Token.
	*/
	kind TokenKind
	/**
   * The character offset at which this Node begins.
	*/
	start int
	/**
   * The character offset at which this Node ends.
	*/
	end int
	/**
   * The 1-indexed line int on which this Token appears.
	*/
	line int
	/**
   * The 1-indexed column int at which this Token begins.
	*/
	column int
	/**
   * For non-punctuation tokens, represents the interpreted value of the token.
   *
   * Note is undefined for punctuation tokens, but typed as string for
   * convenience in the parser.
	*/
	value string
	/**
   * Tokens exist as nodes in a double-linked-list amongst all tokens
   * including ignored tokens. <SOF> is always the first node and <EOF>
   * the last.
	*/
	prev LinkToken
	next LinkToken
	// constructor(
	//   kind TokenKind,
	//   start int,
	//   end int,
	//   line int,
	//   column int,
	//   value ?string,
	// ) {
	//   this.kind = kind
	//   this.start = start
	//   this.end = end
	//   this.line = line
	//   this.column = column
	//   // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
	//   this.value = value!
	//   this.prev = null
	//   this.next = null
	// }
	// get [Symbol.toStringTag]() {
	//   return 'Token'
	// }
	// toJSON() {
	//   kind TokenKind
	//   value ?string
	//   line int
	//   column int
	// } {
	//   return {
	//     kind this.kind,
	//     value this.value,
	//     line this.line,
	//     column this.column,
	//   }
	// }
}

type LinkToken = Empty | Token

/**
 * The list of all possible AST node types.
*/
pub type ASTNode = ArgumentNode
	| BooleanValueNode
	| DirectiveDefinitionNode
	| DirectiveNode
	| DocumentNode
	| EnumTypeDefinitionNode
	| EnumTypeExtensionNode
	| EnumValueDefinitionNode
	| EnumValueNode
	| FieldDefinitionNode
	| FieldNode
	| FloatValueNode
	| FragmentDefinitionNode
	| FragmentSpreadNode
	| InlineFragmentNode
	| InputObjectTypeDefinitionNode
	| InputObjectTypeExtensionNode
	| InputValueDefinitionNode
	| IntValueNode
	| InterfaceTypeDefinitionNode
	| InterfaceTypeExtensionNode
	| ListTypeNode
	| ListValueNode
	| NameNode
	| NamedTypeNode
	| NonNullTypeNode
	| NullValueNode
	| ObjectFieldNode
	| ObjectTypeDefinitionNode
	| ObjectTypeExtensionNode
	| ObjectValueNode
	| OperationDefinitionNode
	| OperationTypeDefinitionNode
	| ScalarTypeDefinitionNode
	| ScalarTypeExtensionNode
	| SchemaDefinitionNode
	| SchemaExtensionNode
	| SelectionSetNode
	| StringValueNode
	| UnionTypeDefinitionNode
	| UnionTypeExtensionNode
	| VariableDefinitionNode
	| VariableNode

/**
 * Utility type listing all nodes indexed by their  Kind.
*/
// pub type ASTKindToNode = {
//   [NodeT in ASTNode as NodeT['kind']] NodeT
// }

/**
 * @internal
*/
// export const QueryDocumentKeys {
//   [NodeT in ASTNode as NodeT['kind']] keyof []NodeT
// } = {
//   Name [],

//   Document ['definitions'],
//   OperationDefinition [
//     'name',
//     'variable_definitions',
//     'directives',
//     'selection_set',
//   ],
//   VariableDefinition ['variable', 'type', 'default_value', 'directives'],
//   Variable ['name'],
//   SelectionSet ['selections'],
//   Field ['alias', 'name', 'arguments', 'directives', 'selection_set'],
//   Argument ['name', 'value'],

//   FragmentSpread ['name', 'directives'],
//   InlineFragment ['type_condition', 'directives', 'selection_set'],
//   FragmentDefinition [
//     'name',
//     // Note fragment variable definitions are deprecated and will removed in v17.0.0
//     'variable_definitions',
//     'type_condition',
//     'directives',
//     'selection_set',
//   ],

//   IntValue [],
//   FloatValue [],
//   StringValue [],
//   BooleanValue [],
//   NullValue [],
//   EnumValue [],
//   ListValue ['values'],
//   ObjectValue ['fields'],
//   ObjectField ['name', 'value'],

//   Directive ['name', 'arguments'],

//   NamedType ['name'],
//   ListType ['type'],
//   NonNullType ['type'],

//   SchemaDefinition ['description', 'directives', 'operation_types'],
//   OperationTypeDefinition ['type'],

//   ScalarTypeDefinition ['description', 'name', 'directives'],
//   ObjectTypeDefinition [
//     'description',
//     'name',
//     'interfaces',
//     'directives',
//     'fields',
//   ],
//   FieldDefinition ['description', 'name', 'arguments', 'type', 'directives'],
//   InputValueDefinition [
//     'description',
//     'name',
//     'type',
//     'default_value',
//     'directives',
//   ],
//   InterfaceTypeDefinition [
//     'description',
//     'name',
//     'interfaces',
//     'directives',
//     'fields',
//   ],
//   UnionTypeDefinition ['description', 'name', 'directives', 'types'],
//   EnumTypeDefinition ['description', 'name', 'directives', 'values'],
//   EnumValueDefinition ['description', 'name', 'directives'],
//   InputObjectTypeDefinition ['description', 'name', 'directives', 'fields'],

//   DirectiveDefinition ['description', 'name', 'arguments', 'locations'],

//   SchemaExtension ['directives', 'operation_types'],

//   ScalarTypeExtension ['name', 'directives'],
//   ObjectTypeExtension ['name', 'interfaces', 'directives', 'fields'],
//   InterfaceTypeExtension ['name', 'interfaces', 'directives', 'fields'],
//   UnionTypeExtension ['name', 'directives', 'types'],
//   EnumTypeExtension ['name', 'directives', 'values'],
//   InputObjectTypeExtension ['name', 'directives', 'fields'],
// }

// const kindValues = new Set<string>(Object.keys(QueryDocumentKeys))
/**
 * @internal
*/
// export function isNode(maybeNode any) maybeNode is ASTNode {
//   const maybeKind = maybeNode?.kind
//   return typeof maybeKind === 'string' && kindValues.has(maybeKind)
// }

//* Name

pub struct NameNode {
	kind  Kind = Kind.name
	loc   ?Location
	value string
}

//* Document

pub struct DocumentNode {
	kind        Kind = Kind.document
	loc         ?Location
	definitions []DefinitionNode
}

pub type DefinitionNode = ExecutableDefinitionNode
	| TypeSystemDefinitionNode
	| TypeSystemExtensionNode

pub type ExecutableDefinitionNode = FragmentDefinitionNode | OperationDefinitionNode

pub struct OperationDefinitionNode {
	kind                 Kind = Kind.operation_definition
	loc                  ?Location
	operation            OperationTypeNode
	name                 ?NameNode
	variable_definitions ?[]VariableDefinitionNode
	directives           ?[]DirectiveNode
	selection_set        SelectionSetNode
}

pub enum OperationTypeNode {
	query
	mutation
	subscription
}

pub fn (o OperationTypeNode) value() string {
	match o {
		.query {
			return 'query'
		}
		.mutation {
			return 'mutation'
		}
		.subscription {
			return 'subscription'
		}
	}
}

pub struct VariableDefinitionNode {
	kind          Kind = Kind.variable_definition
	loc           ?Location
	variable      VariableNode
	type_node     TypeNode
	default_value ?ConstValueNode
	directives    ?[]ConstDirectiveNode
}

pub struct VariableNode {
	kind Kind = Kind.variable_value
	loc  ?Location
	name NameNode
}

pub struct SelectionSetNode {
	kind       Kind = Kind.selection_set
	loc        ?Location
	selections []SelectionNode
}

pub type SelectionNode = FieldNode | FragmentSpreadNode | InlineFragmentNode

pub struct FieldNode {
	kind          Kind = Kind.field
	loc           ?Location
	alias         ?NameNode
	name          NameNode
	arguments     ?[]ArgumentNode
	directives    ?[]DirectiveNode
	selection_set ?SelectionSetNode
}

pub struct ArgumentNode {
	kind  Kind = Kind.argument
	loc   ?Location
	name  NameNode
	value ValueNode
}

pub struct ConstArgumentNode {
	kind  Kind = Kind.argument
	loc   ?Location
	name  NameNode
	value ConstValueNode
}

//* Fragments

pub struct FragmentSpreadNode {
	kind       Kind = Kind.fragment_spread
	loc        ?Location
	name       NameNode
	directives ?[]DirectiveNode
}

pub struct InlineFragmentNode {
	kind           Kind = Kind.inline_fragment
	loc            ?Location
	type_condition ?NamedTypeNode
	directives     ?[]DirectiveNode
	selection_set  SelectionSetNode
}

pub struct FragmentDefinitionNode {
	kind                 Kind = Kind.fragment_definition
	loc                  ?Location
	name                 NameNode //* @deprecated variable_definitions will be removed in v17.0.0
	variable_definitions ?[]VariableDefinitionNode
	type_condition       NamedTypeNode
	directives           ?[]DirectiveNode
	selection_set        SelectionSetNode
}

//* Values

pub type ValueNode = BooleanValueNode
	| EnumValueNode
	| FloatValueNode
	| IntValueNode
	| ListValueNode
	| NullValueNode
	| ObjectValueNode
	| StringValueNode
	| VariableNode

pub type ConstValueNode = BooleanValueNode
	| ConstListValueNode
	| ConstObjectValueNode
	| EnumValueNode
	| FloatValueNode
	| IntValueNode
	| NullValueNode
	| StringValueNode

pub struct IntValueNode {
	kind  Kind = Kind.int_value
	loc   ?Location
	value string
}

pub struct FloatValueNode {
	kind  Kind = Kind.float_value
	loc   ?Location
	value string
}

pub struct StringValueNode {
	kind  Kind = Kind.string_value
	loc   ?Location
	value string
	block ?bool
}

pub struct BooleanValueNode {
	kind  Kind = Kind.boolean_value
	loc   ?Location
	value bool
}

pub struct NullValueNode {
	kind Kind = Kind.null_value
	loc  ?Location
}

pub struct EnumValueNode {
	kind  Kind = Kind.enum_value
	loc   ?Location
	value string
}

pub struct ListValueNode {
	kind   Kind = Kind.list_value
	loc    ?Location
	values []ValueNode
}

pub struct ConstListValueNode {
	kind   Kind = Kind.list_value
	loc    ?Location
	values []ConstValueNode
}

pub struct ObjectValueNode {
	kind   Kind = Kind.object_value
	loc    ?Location
	fields []ObjectFieldNode
}

pub struct ConstObjectValueNode {
	kind   Kind = Kind.object_value
	loc    ?Location
	fields []ConstObjectFieldNode
}

pub struct ObjectFieldNode {
	kind  Kind = Kind.object_field_value
	loc   ?Location
	name  NameNode
	value ValueNode
}

pub struct ConstObjectFieldNode {
	kind  Kind = Kind.object_field_value
	loc   ?Location
	name  NameNode
	value ConstValueNode
}

//* Directives

pub struct DirectiveNode {
	kind      Kind = Kind.directive
	loc       ?Location
	name      NameNode
	arguments ?[]ArgumentNode
}

pub struct ConstDirectiveNode {
	kind      Kind = Kind.directive
	loc       ?Location
	name      NameNode
	arguments ?[]ConstArgumentNode
}

//* Type Reference

pub type TypeNode = ListTypeNode | NamedTypeNode | NonNullTypeNode

pub struct NamedTypeNode {
	kind Kind = Kind.named_type
	loc  ?Location
	name NameNode
}

pub struct ListTypeNode {
	kind      Kind = Kind.list_type
	loc       ?Location
	type_node TypeNode
}

pub struct NonNullTypeNode {
	kind      Kind = Kind.non_null_type
	loc       ?Location
	type_node NamedTypeNode | ListTypeNode
}

//* Type System Definition

pub type TypeSystemDefinitionNode = DirectiveDefinitionNode
	| SchemaDefinitionNode
	| TypeDefinitionNode

pub struct SchemaDefinitionNode {
	kind            Kind = Kind.schema_definition
	loc             ?Location
	description     ?StringValueNode
	directives      ?[]ConstDirectiveNode
	operation_types []OperationTypeDefinitionNode
}

pub struct OperationTypeDefinitionNode {
	kind      Kind = Kind.operation_type_definition
	loc       ?Location
	operation OperationTypeNode
	type_node NamedTypeNode
}

//* Type Definition

pub type TypeDefinitionNode = EnumTypeDefinitionNode
	| InputObjectTypeDefinitionNode
	| InterfaceTypeDefinitionNode
	| ObjectTypeDefinitionNode
	| ScalarTypeDefinitionNode
	| UnionTypeDefinitionNode

pub struct ScalarTypeDefinitionNode {
	kind        Kind = Kind.scalar_type_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	directives  ?[]ConstDirectiveNode
}

pub struct ObjectTypeDefinitionNode {
	kind        Kind = Kind.object_type_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	interfaces  ?[]NamedTypeNode
	directives  ?[]ConstDirectiveNode
	fields      ?[]FieldDefinitionNode
}

pub struct FieldDefinitionNode {
	kind        Kind = Kind.field_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	arguments   ?[]InputValueDefinitionNode
	type_node   TypeNode
	directives  ?[]ConstDirectiveNode
}

pub struct InputValueDefinitionNode {
	kind          Kind = Kind.input_value_definition
	loc           ?Location
	description   ?StringValueNode
	name          NameNode
	type_node     TypeNode
	default_value ?ConstValueNode
	directives    ?[]ConstDirectiveNode
}

pub struct InterfaceTypeDefinitionNode {
	kind        Kind = Kind.interface_type_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	interfaces  ?[]NamedTypeNode
	directives  ?[]ConstDirectiveNode
	fields      ?[]FieldDefinitionNode
}

pub struct UnionTypeDefinitionNode {
	kind        Kind = Kind.union_type_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	directives  ?[]ConstDirectiveNode
	types       ?[]NamedTypeNode
}

pub struct EnumTypeDefinitionNode {
	kind        Kind = Kind.enum_type_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	directives  ?[]ConstDirectiveNode
	values      ?[]EnumValueDefinitionNode
}

pub struct EnumValueDefinitionNode {
	kind        Kind = Kind.enum_value_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	directives  ?[]ConstDirectiveNode
}

pub struct InputObjectTypeDefinitionNode {
	kind        Kind = Kind.input_object_type_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	directives  ?[]ConstDirectiveNode
	fields      ?[]InputValueDefinitionNode
}

//* Directive Definitions

pub struct DirectiveDefinitionNode {
	kind        Kind = Kind.directive_definition
	loc         ?Location
	description ?StringValueNode
	name        NameNode
	arguments   ?[]InputValueDefinitionNode
	repeatable  bool
	locations   []NameNode
}

//* Type System Extensions

pub type TypeSystemExtensionNode = SchemaExtensionNode | TypeExtensionNode

pub struct SchemaExtensionNode {
	kind            Kind = Kind.schema_extension
	loc             ?Location
	directives      ?[]ConstDirectiveNode
	operation_types ?[]OperationTypeDefinitionNode
}

//* Type Extensions

pub type TypeExtensionNode = EnumTypeExtensionNode
	| InputObjectTypeExtensionNode
	| InterfaceTypeExtensionNode
	| ObjectTypeExtensionNode
	| ScalarTypeExtensionNode
	| UnionTypeExtensionNode

pub struct ScalarTypeExtensionNode {
	kind       Kind = Kind.scalar_type_extension
	loc        ?Location
	name       NameNode
	directives ?[]ConstDirectiveNode
}

pub struct ObjectTypeExtensionNode {
	kind       Kind = Kind.object_type_extension
	loc        ?Location
	name       NameNode
	interfaces ?[]NamedTypeNode
	directives ?[]ConstDirectiveNode
	fields     ?[]FieldDefinitionNode
}

pub struct InterfaceTypeExtensionNode {
	kind       Kind = Kind.interface_type_extension
	loc        ?Location
	name       NameNode
	interfaces ?[]NamedTypeNode
	directives ?[]ConstDirectiveNode
	fields     ?[]FieldDefinitionNode
}

pub struct UnionTypeExtensionNode {
	kind       Kind = Kind.union_type_extension
	loc        ?Location
	name       NameNode
	directives ?[]ConstDirectiveNode
	types      ?[]NamedTypeNode
}

pub struct EnumTypeExtensionNode {
	kind       Kind = Kind.enum_type_extension
	loc        ?Location
	name       NameNode
	directives ?[]ConstDirectiveNode
	values     ?[]EnumValueDefinitionNode
}

pub struct InputObjectTypeExtensionNode {
	kind       Kind = Kind.input_object_type_extension
	loc        ?Location
	name       NameNode
	directives ?[]ConstDirectiveNode
	fields     ?[]InputValueDefinitionNode
}
