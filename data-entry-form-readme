Overview:
A basic data entry form that allows data to be created, manipulated, deleted and viewed in a Database Management System or File System.

VALID INPUT REQUIREMENTS:
Notes 
	- Relative URIs (scoped to Document Name field value) are presumed for single word values entered into any of the input files
	- CURIES are accepted, if targeting a Virtuoso instance based on the fact that it has preloaded namespaces per DBMS instance
Subject Field Values
- Must be a reference (uri) or blank node (cannot be a literal value)
- References
	- Default (as per Relative URIs comments above)
	- Accepted inputs: Absolute References, CURIES, URIs quoted withing <> as per RDF-Turtle
- Blank Nodes
	- Accepted inputs: _:{blank-node} or {<predicate> <object>}, [<predicate> <object>]
	
Predicate Field Values
- Must be a reference
	- Accepted inputs: Absolute References, CURIES, URIs quoted withing <> as per RDF-Turtle
	
Object Field Values

- References
	- Default (as per Relative URIs comments above)
	- Accepted inputs: Absolute References, CURIES, URIs quoted withing <> as per RDF-Turtle
- Literal Values
	- Accepted inputs: Unquoted phrases or quoted words
	- Not Accepted: Unquoted words (this will be converted to a Relative URI)
- Blank Nodes
	- Accepted inputs: _:{blank-node} or {<predicate> <object>}, [<predicate> <object>]
	
LANGUAGE TAGS:
- Language tags must be associated with a quoted word or phrase 
	- Accepted: "{something}"@en
	- Not Accepted: {something}@en
