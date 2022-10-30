Logical: SupplyRequest
Parent: Element
Id: model-supply-request
Description: "This is the logical model for the SupplyRequest"
* ^type = "SupplyRequest"
* . ^short = "A request for supply of one or more healthcare products"
* identifier 0..1 Identifier
* status 1..1 code
* dateTime 0..1 dateTime
* requester 0..1 Reference
* filler 0..1 Reference
* item 1..* BackboneElement
  * item 1..* CodeableReference
  * quantity 1..* Quantity
  * originLocation 0..* Reference
* destinationLocation 0..* Reference
* additionalInfo 0..* Reference or Annotation "The prescription identification" "."
* note 0..* http://hl7.org/fhir/StructureDefinition/Annotation "Additional information about the request" "Additional information about the request - this can be relevant history, any remarks by the patient or professional, etc."