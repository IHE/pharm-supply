


Logical: SupplyRequest
Parent: Element
Id: model-supply-request
Description: "This is the logical model for the SupplyRequest"
* ^url = "https://www.ihe.net/fhir/StructureDefinition/model-supplyrequest"
* ^version = "0.3.0"
* ^status = #draft
* ^date = "2022-12-27T13:18:13+01:00"
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
* ^type = "SupplyRequest"
* . ^short = "A request for supply of one or more healthcare products"
* identifier 0..1 Identifier "Identifier"
* status 1..1 code "code"
* type 0..1 CodeableConcept "type of request - e.g. type of distribution, priority, etc."
* dateTime 0..1 dateTime "date time"
* requester 0..1 Reference "requester"
* originalRequest 0..1 Reference "Original request"
* filler 0..1 Reference "filler"
* item 1..* BackboneElement "item"
* item
  * itemreference[x] 1..1 Reference or CodeableConcept "item reference"
  * quantity 1..* Quantity "quantity"
  * originLocation 0..* Reference "origin location"
* destinationLocation 0..* Reference "destination location"
* additionalInfo[x] 0..* Reference or Annotation "Additional information about the request" "Additional information about the request - this can be relevant history, any remarks by the patient or professional, etc."




//////////////////////////////////////

Logical: SupplyRequestStatus
Parent: Element
Id: model-supply-request-status
Description: "This is the logical model for the Supply Request Status"
* ^version = "0.3.0"
* ^status = #draft
* ^date = "2022-12-27T13:18:13+01:00"
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
* ^type = "SupplyRequestStatus"
* . ^short = "A request for supply of one or more healthcare products"
* identifier 0..1 Identifier "identifier"
* status 1..1 code "code"
* type 0..1 CodeableConcept "type of request - e.g. type of distribution, priority, etc."
* dateTime 0..1 dateTime "date time"
* requester 0..1 Reference "requester"
* filler 0..1 Reference "performer"
* item 1..* BackboneElement "item"
  * itemreference[x] 1..1 Reference or CodeableConcept "item reference"
  * quantity 1..* Quantity "quantity"
  * originLocation 0..* Reference "origin location"
* destinationLocation 0..* Reference "destination location"
* additionalInfo[x] 0..* Reference or Annotation "Additional information about the request" "Additional information about the request - this can be relevant history, any remarks by the patient or professional, etc."
//* note 0..* http://hl7.org/fhir/StructureDefinition/Annotation "Additional information about the request" "Additional information about the request - this can be relevant history, any remarks by the patient or professional, etc."




/////////////////////////////////////////////////


Logical: ShipmentNotice
Parent: Element
Id: model-shipment-notice
Description: "This is the logical model for the ShipmentNotice"
* ^version = "0.3.0"
* ^status = #draft
* ^date = "2022-12-27T13:18:13+01:00"
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
* identifier 0..1 Identifier "identifier"
* status 1..1 code "status"
* dateTime 0..1 dateTime "date time"
* requestIdentifier 0..1 Identifier "request identifier"
* supplier 0..1 Reference "sender"
* supplierLocation 0..1 Location "sender location"
* receiver 0..1 Reference "receiver"
* receiverLocation 0..1 Location "receiver location"
* item 1..* BackboneElement "item"
  * itemreference[x] 1..1 Reference or CodeableConcept "item reference"
  * quantity 1..1 Quantity "quantity"
* additionalInfo[x] 0..* Reference or Annotation "Additional information about the delivery" "Additional information about the delivery - this can be relevant history, any remarks by the patient or professional, etc."



Logical: ReceiptNotice
Parent: Element
Id: model-receipt-notice
Description: "This is the logical model for the ReceiptNotice"
* ^version = "0.3.0"
* ^status = #draft
* ^date = "2022-12-27T13:18:13+01:00"
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
* identifier 0..1 Identifier "Shipment identifier"
* status 1..1 code "status"
* dateTime 0..1 dateTime "date time"
* requestIdentifier 0..1 Identifier "Request identifier"
* supplier 0..1 Reference "Supplier"
* supplierLocation 0..1 Location "Supplier location"
* receiver 0..1 Reference "Receiver"
* receiverLocation 0..1 Location "receiver location"
* item 1..* BackboneElement "item"
  * itemreference[x] 1..1 Reference or CodeableConcept "item reference"
  * quantity 1..1 Quantity "quantity"
  * quantity ^comment = "This is the count of items that have been received. This does not mean a pack quantity. For example if one box containing 20 devices has been received, and the code is for the box, then quantity is 1. If however, the code used to identify the product is the code of the device, then the quantity is 20."
* additionalInfo[x] 0..* Reference or Annotation "Additional information about the delivery" "Additional information about the delivery - this can be relevant history, any remarks by the patient or professional, etc."







///////////////////////////////////



Logical: InventoryStatus
Parent: Element
Id: model-inventory-status
Description: "This is the logical model for the Inventory Status report - an information about the current status of a given inventory position. This is to be typically used in inventory counts - physical counts or estimates. It supports a report per status, per location, or a combination of both (which is how typically items are counted and reported)."
* ^version = "0.3.0"
* ^status = #draft
* ^date = "2022-12-27T13:18:13+01:00"
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
* ^type = "InventoryStatus"
* . ^short = "Enables a party to provide information on inventory levels"
* identifier 0..1 Identifier "Unique identification of the inventory report" "Unique identification of the inventory report"
* countType 0..1 code "The type of counting - whether it is a manual counting, automated data capture, estimate.." "The type of counting - whether it is a manual counting, automated data capture, estimate.."
* requestIdentifier 0..1 Identifier "The logistics inventory report request, if applicable" "The logistics inventory report request, if applicable"
* reportDateTime 0..1 dateTime "Date and time of finalization of the report" "Date and time of finalization of the report"
* reporter 0..1 Reference "Person or entity that creates the report" "Person or entity that creates the report"
* reportingPeriod 0..1 Period "The period to which the inventory status refers" "The period to which the inventory status refers"
* inventoryListing 0..* BackboneElement "Contains the inventory information entries" "Contains the inventory information entries"
  * location 0..1 Reference "Identification of the site where the items are located" "Identification of the site where the items are located"
  * status 0..1 CodeableConcept "The inventory status of a set of items (of the same type) at a specific sub-location at a specific point in time" "The inventory status of a set of items (of the same type) at a specific sub-location at a specific point in time"
  * items 0..* BackboneElement "The inventory items" "The inventory items"
    * category 0..* code "The category of the inventory items" "The category of the inventory items"
    * quantity 0..1 Quantity "Quantity of items" "Quantity of items"
  * items.item 0..1 BackboneElement "An item or set of items (of the same type and status)" "An item or set of items (of the same type and status)"
  * countingDateTime 0..1 dateTime "The time that the inventory items in this listing were physically checked" "The time that the inventory items in this listing were physically checked"

Mapping: InventoryStatusGS1
Id: inventory-status-gs1
Title: "GS1 XML EDI Logistics Inventory Report"
Description: "Link to GS1 standard EDI message. Also see IHE Pharmacy Supply White paper"
Source: InventoryStatus
Target: "https://www.gs1.org/docs/EDI/ecom-xml/functional-user-guide/3_4/HTML/LIP/a1.htm"



//////////////////////////////////////

Logical: InventoryChange
Parent: Element
Id: model-inventory-change
Description: "This is the logical model for the Inventory Change notification - an information about a change of items being added or removed from a given inventory position. This is to be typically used in differential inventory updates (e.g. \"Since last time, the following items have been consumed\") or to register items added or subtracted (e.g. \"The following 2 items were just discarded and should be deducted from inventory \")"
* ^version = "0.3.0"
* ^status = #draft
* ^date = "2022-12-27T13:18:13+01:00"
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
* ^type = "InventoryChange"
* . ^short = "Enables a party to provide information on inventory levels and inventory changes."
* identifier 0..1 Identifier "Unique identification of the inventory report" "Unique identification of the inventory report"
* countType 0..1 code "The type of counting - whether it is a manual counting, automated data capture, estimate.." "The type of counting - whether it is a manual counting, automated data capture, estimate.."
* operationType 1..1 code "The type of operation - add/subtract" "The type of operation - add/subtract"
* operationTypeReason[x] 1..1 CodeableConcept or Reference "The reason or detail for the change. For example a new reception"
* reportDateTime 0..1 dateTime "Date and time of finalization of the report" "Date and time of finalization of the report"
* reporter 0..1 Reference "Person or entity that creates the report" "Person or entity that creates the report"
* reportingPeriod 0..1 Period "The period the inventory changes report to" "The period the inventory changes report to"
* inventoryListing 0..* BackboneElement "Contains the inventory listings" "Contains the inventory listings"
* inventoryListing.location 0..1 Reference "Identification of the site where the items are/were located" "Identification of the site where the items are/were located"
* inventoryListing.status 0..1 CodeableConcept "The inventory status of a set of items (of the same type)" "The inventory status of a set of items (of the same type)"
* inventoryListing.items 0..* BackboneElement "The inventory items" "The inventory items"
* inventoryListing.items.category 0..* code "The category of the inventory items" "The category of the inventory items"
* inventoryListing.items.quantity 0..1 Quantity "Quantity of items" "Quantity of items"
* inventoryListing.items.item 0..1 BackboneElement "An item or set of items (of the same type and status)" "An item or set of items (of the same type and status)"
* inventoryListing.countingDateTime 0..1 dateTime "The time that the changes in this listing actually occurred" "The time that the changes in this listing actually occurred"

// Mapping: InventoryChangeGS1
// Id: inventory-change-GS1
// Title: "GS1 XML EDI Logistics Inventory Report"
// Description: "Link to GS1 standard EDI message. Also see IHE Pharmacy Supply White paper"
// Source: InventoryChange
// Target: "https://www.gs1.org/docs/EDI/ecom-xml/functional-user-guide/3_4/HTML/LIP/a1.htm"


