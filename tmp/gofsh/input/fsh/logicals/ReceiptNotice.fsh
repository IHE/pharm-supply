Logical: ReceiptNotice
Parent: Element
Id: model-receipt-notice
Description: "This is the logical model for the ReceiptNotice"
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
* ^type = "ReceiptNotice"
* . ^short = "A request for supply of one or more healthcare products"
* identifier 0..1 Identifier
* dateTime 0..1 dateTime
* requestIdentifier 0..1 Identifier
* shipmentIdentifier 0..1 Identifier
* status 1..1 code
* sender 0..1 Reference
* receiver 0..1 Reference
* receiverLocation 0..1 Location
* item 1..* BackboneElement
  * item 1..* CodeableReference
  * quantity 1..1 Quantity
    * ^comment = "This is the count of items that have been received. This does not mean a pack quantity. For example if one box containing 20 devices has been received, and the code is for the box, then quantity is 1. If however, the code used to identify the product is the code of the device, then the quantity is 20."
* additionalInfo 0..* Reference or Annotation "The prescription identification" "."
* note 0..* http://hl7.org/fhir/StructureDefinition/Annotation "Additional information about the shipment" "Additional information about the shipment"