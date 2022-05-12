module kinds

pub enum Kind {
	//* Name
	name
	//* Document
	document
	operation_definition
	variable_definition
	selection_set
	field
	argument
	//* Fragments
	fragment_spread
	inline_fragment
	fragment_definition
	//* Values
	variable_value
	int_value
	float_value
	string_value
	boolean_value
	null_value
	enum_value
	list_value
	object_value
	object_field_value
	//* Directives
	directive
	//* Types
	named_type
	list_type
	non_null_type
	//* Type System Definitions
	schema_definition
	operation_type_definition
	//* Type Definitions
	scalar_type_definition
	object_type_definition
	field_definition
	input_value_definition
	interface_type_definition
	union_type_definition
	enum_type_definition
	enum_value_definition
	input_object_type_definition
	//* Directive Definitions
	directive_definition
	//* Type System Extensions
	schema_extension
	//* Type Extensions
	scalar_type_extension
	object_type_extension
	interface_type_extension
	union_type_extension
	enum_type_extension
	input_object_type_extension
}

pub fn (k Kind) value() string {
	match k {
		.name {
			return 'Name'
		}
		.document {
			return 'Document'
		}
		.operation_definition {
			return 'OperationDefinition'
		}
		.variable_definition {
			return 'VariableDefinition'
		}
		.selection_set {
			return 'SelectionSet'
		}
		.field {
			return 'Field'
		}
		.argument {
			return 'Argument'
		}
		.fragment_spread {
			return 'FragmentSpread'
		}
		.inline_fragment {
			return 'InlineFragment'
		}
		.fragment_definition {
			return 'FragmentDefinition'
		}
		.variable_value {
			return 'Variable'
		}
		.int_value {
			return 'IntValue'
		}
		.float_value {
			return 'FloatValue'
		}
		.string_value {
			return 'StringValue'
		}
		.boolean_value {
			return 'BooleanValue'
		}
		.null_value {
			return 'NullValue'
		}
		.enum_value {
			return 'EnumValue'
		}
		.list_value {
			return 'ListValue'
		}
		.object_value {
			return 'ObjectValue'
		}
		.object_field_value {
			return 'ObjectField'
		}
		.directive {
			return 'Directive'
		}
		.named_type {
			return 'NamedType'
		}
		.list_type {
			return 'ListType'
		}
		.non_null_type {
			return 'NonNullType'
		}
		.schema_definition {
			return 'SchemaDefinition'
		}
		.operation_type_definition {
			return 'OperationTypeDefinition'
		}
		.scalar_type_definition {
			return 'ScalarTypeDefinition'
		}
		.object_type_definition {
			return 'ObjectTypeDefinition'
		}
		.field_definition {
			return 'FieldDefinition'
		}
		.input_value_definition {
			return 'InputValueDefinition'
		}
		.interface_type_definition {
			return 'InterfaceTypeDefinition'
		}
		.union_type_definition {
			return 'UnionTypeDefinition'
		}
		.enum_type_definition {
			return 'EnumTypeDefinition'
		}
		.enum_value_definition {
			return 'EnumValueDefinition'
		}
		.input_object_type_definition {
			return 'InputObjectTypeDefinition'
		}
		.directive_definition {
			return 'DirectiveDefinition'
		}
		.schema_extension {
			return 'SchemaExtension'
		}
		.scalar_type_extension {
			return 'ScalarTypeExtension'
		}
		.object_type_extension {
			return 'ObjectTypeExtension'
		}
		.interface_type_extension {
			return 'InterfaceTypeExtension'
		}
		.union_type_extension {
			return 'UnionTypeExtension'
		}
		.enum_type_extension {
			return 'EnumTypeExtension'
		}
		.input_object_type_extension {
			return 'InputObjectTypeExtension'
		}
	}
}
