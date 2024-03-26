Instance: 123
InstanceOf: InventoryItem

* status = #active


Instance: i1231
InstanceOf: InventoryItem

* status = #active

* name[+]
  * nameType = http://hl7.org/fhir/inventoryitem-nametype#preferred
  * language = #en
  * name = "Respirator Mask, N95/FFP2, Medium"



Instance: i1234
InstanceOf: InventoryItem

* status = #active

* name[+]
  * nameType = http://hl7.org/fhir/inventoryitem-nametype#preferred
  * language = #en
  * name = "Respirator Mask, N95/FFP2, Medium"


Instance: i12341
InstanceOf: InventoryItem

* status = #active

* name[+]
  * nameType = http://hl7.org/fhir/inventoryitem-nametype#preferred
  * language = #en
  * name = "Respirator Mask, N95/FFP2, Medium"

* name[+]
  * nameType = http://hl7.org/fhir/inventoryitem-nametype#tradename
  * language = #en
  * name = "ACME Co N95, size Medium"





* identifier[+]
  * system = "https://www.gs1.org/gtin"
  * value = "012345678"

* association[+]
  * associationType = #parent
  * relatedItem = Reference(123)
  * quantity.numerator.value = 1