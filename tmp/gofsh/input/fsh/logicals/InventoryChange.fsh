Logical: InventoryChange
Parent: Element
Id: model-inventory-change
Description: "This is the logical model for the Inventory Change notification - an information about a change of items being added or removed from a given inventory position. This is to be typically used in differential inventory updates (e.g. \"Since last time, the following items have been consumed\") or to register items added or subtracted (e.g. \"The following 2 items were just discarded and should be deducted from inventory \")"
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
* ^type = "InventoryChange"
* . ^short = "Enables a party to provide information on inventory levels and inventory changes."
* identifier 0..1 Identifier "Unique identification of the inventory report" "Unique identification of the inventory report"
* countType 0..1 code "The type of counting - whether it is a manual counting, automated data capture, estimate.." "The type of counting - whether it is a manual counting, automated data capture, estimate.."
* operationType 1..1 code "The type of operation - add/subtract" "The type of operation - add/subtract"
* operationTypeReason 1..1 CodeableReference "The reason or detail for the change. For example a new reception, or a " "The reason or detail for the change. For example a new reception, or a "
* reportDateTime 0..1 dateTime "Date and time of finalization of the report" "Date and time of finalization of the report"
* reporter 0..1 Reference "Person or entity that creates the report" "Person or entity that creates the report"
* reportingPeriod 0..1 Period "The period the inventory changes report to" "The period the inventory changes report to"
* inventoryListing 0..* BackboneElement "Contains the inventory listings" "Contains the inventory listings"
  * location 0..1 Reference "Identification of the site where the items are/were located" "Identification of the site where the items are/were located"
  * status 0..1 CodeableConcept "The inventory status of a set of items (of the same type)" "The inventory status of a set of items (of the same type)"
  * items 0..* BackboneElement "The inventory items" "The inventory items"
    * category 0..* code "The category of the inventory items" "The category of the inventory items"
    * quantity 0..1 Quantity "Quantity of items" "Quantity of items"
    * item 0..1 BackboneElement "An item or set of items (of the same type and status)" "An item or set of items (of the same type and status)"
  * countingDateTime 0..1 dateTime "The time that the changes in this listing actually occurred" "The time that the changes in this listing actually occurred"