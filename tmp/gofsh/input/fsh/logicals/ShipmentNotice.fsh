Logical: ShipmentNotice
Parent: Element
Id: model-shipment-notice
Description: "This is the logical model for the ShipmentNotice"
* ^version = "0.3.0"
* ^status = #draft
* ^date = "2022-10-30T09:58:18+01:00"
* ^publisher = "IHE Pharmacy Technical Committee"
* ^contact[0].telecom.system = #url
* ^contact[=].telecom.value = "https://www.ihe.net/ihe_domains/pharmacy/"
* ^contact[+].telecom.system = #email
* ^contact[=].telecom.value = "pharmacy@ihe.net"
* ^contact[+].name = "IHE Pharmacy Technical Committee"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "pharmacy@ihe.net"
* ^jurisdiction.coding.system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction.coding.code = #001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* ^type = "ShipmentNotice"
* . ^short = "A request for supply of one or more healthcare products"
* identifier 0..1 Identifier
* dateTime 0..1 dateTime
* requestIdentifier 0..1 Identifier
* status 1..1 code
* sender 0..1 Reference
* senderLocation 0..1 Location
* receiver 0..1 Reference
* receiverLocation 0..1 Location
* item 1..* BackboneElement
  * item 1..* CodeableReference
  * quantity 1..1 Quantity
* additionalInfo 0..* Reference or Annotation "The prescription identification" "."
* note 0..* http://hl7.org/fhir/StructureDefinition/Annotation "Additional information about the shipment" "Additional information about the shipment"