Logical: InventoryStatus
Parent: Element
Id: model-inventory-status
Description: "This is the logical model for the Inventory Status report - an information about the current status of a given inventory position. This is to be typically used in inventory counts - physical counts or estimates. It supports a report per status, per location, or a combination of both (which is how typically items are counted and reported)."
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
    * item 0..1 BackboneElement "An item or set of items (of the same type and status)" "An item or set of items (of the same type and status)"
  * countingDateTime 0..1 dateTime "The time that the inventory items in this listing were physically checked" "The time that the inventory items in this listing were physically checked"