
# Profile

MTConnect Profile is a {{term(profile)}} that extends the {{term(SysML)}} metamodel for the MTConnect domain using additional data types and {{termplural(stereotype)}}.

## DataTypes

![DataTypes](figures/DataTypes.png "DataTypes")

### boolean

primitive type.



### ID

string that represents an {{term(ID)}}.



### string

primitive type.



### float

primitive type.



### datetime

string that represents timestamp in ISO 8601 format.



### integer

primitive type.



### xlinktype

string that represents the type of an XLink element. See {{url(https://www.w3.org/TR/xlink11/)}}.



### xslang

string that represents a language tag. See {{url(http://www.ietf.org/rfc/rfc4646.txt)}}.



### SECOND

float that represents time in seconds.



### xlinkhref

string that represents the locator attribute of an XLink element. See {{url(https://www.w3.org/TR/xlink11/)}}.



### x509

string that represents an `x509` data block. {{cite(ISO/IEC 9594-8:2020)}}.



### int32

32-bit integer.



### int64

64-bit integer.



### version

series of three numeric values, separated by a decimal point, representing a {{term(major)}}, {{term(minor)}}, and {{term(patch)}} number of the MTConnect Standard.



### uint32

32-bit unsigned integer.



### uint64

64-bit unsigned integer.



### binary

base-2 numeral system or binary numeral system represented by two digits: "0" and "1".



### double

primitive type.



### Array

array.



### `<<hasFormatSpecificRepresentation>>`float3d

array of size 3 and datatype float.



### UUID

Universally Unique IDentifier. {{cite(IETF:RFC-4122)}}



### METER

float that represents measurement in meter.



## Stereotypes

![Stereotypes](figures/Stereotypes.png "Stereotypes")

### organizer

element that {{termplural(organize)}} other elements of a type.



### deprecated

element that has been deprecated.



### extensible

enumeration that can be extended.



### informative

element that is descriptive and non-normative.



### normative

element that has been added to the standard.



### observes

association in which a {{term(Component)}} makes {{termplural(Observation)}} about an observable {{term(DataItem)}}.



### satisfiedBy





### hasFormatSpecificRepresentation

element that has format specific representation that might be different from the element's SysML representation.



### valueType

extends `Class`to be used as a SysML `<<ValueType>>`.



### isArray

datatype that is an array.



### MTConnectRequirementSpecification

MTConnect Requirement.


