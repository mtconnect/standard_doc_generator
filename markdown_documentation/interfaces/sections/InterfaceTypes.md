
## Interface Types

The abstract {{block(Interface)}} is realized by the following types listed in this section. 

In order to implement the {{term(interaction model)}} for {{termplural(interface)}}, each piece of equipment associated with an {{term(interface)}} **MUST** provide the corresponding {{block(Interface)}} type. A piece of equipment **MAY** support any number of unique {{termplural(interface)}}.

### BarFeederInterface

{{block(Interface)}} that coordinates the operations between a bar feeder and another piece of equipment.

Bar feeder is a piece of equipment that pushes bar stock (i.e., long pieces of material of various shapes) into an associated piece of equipment – most typically a lathe or turning center.



### ChuckInterface

{{block(Interface)}} that coordinates the operations between two pieces of equipment, one of which controls the operation of a chuck.

The piece of equipment that is controlling the chuck **MUST** provide the data item {{block(ChuckState)}} as part of the set of information provided.



### DoorInterface

{{block(Interface)}} that coordinates the operations between two pieces of equipment, one of which controls the operation of a door.

The piece of equipment that is controlling the door **MUST** provide data item {{block(DoorState)}} as part of the set of information provided.



### MaterialHandlerInterface

{{block(Interface)}} that coordinates the operations between a piece of equipment and another associated piece of equipment used to automatically handle various types of materials or services associated with the original piece of equipment.

A material handler is a piece of equipment capable of providing any one, or more, of a variety of support services for another piece of equipment or a process like:

* Loading/unloading material or tooling
* Part inspection
* Testing
* Cleaning

A robot is a common example of a material handler.


