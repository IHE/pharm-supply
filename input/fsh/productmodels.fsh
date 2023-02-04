Logical: Item
Parent: Element
Id: model-item
Description: "This is the logical model for the Inventory Change notification - an information about a change of items being added or removed from a given inventory position. This is to be typically used in differential inventory updates (e.g. \"Since last time, the following items have been consumed\") or to register items added or subtracted (e.g. \"The following 2 items were just discarded and should be deducted from inventory \")"
* ^version = "0.3.0"
* ^status = #draft
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
* ^type = "Item"
* . ^short = "A tradeable item, i.e. something that can be manufactured and distributed by a given entity (in opposition to a Product, which is a abstracted representation of the product’s functionality"
* identifier 0..* Identifier "Business identifier(s) of the item, for example the GTIN code" "Business identifier(s) of the item, for example the GTIN code"
* quantity 0..* SimpleQuantity "The Quantity of Base Unit of Measure (how many Base UoM are in this item)." "The Quantity of Base Unit of Measure (how many Base UoM are in this item)."
* containedItem 1..1 Reference(model-item) "The contained item" "The contained item"
* tradeItemUnitDescriptorCode 0..1 code "'box', 'unit', 'pallet'" "'box', 'unit', 'pallet'"
* itemName 1..* BackboneElement "The item name(s) - the brand name, or common name, functional name, generic name...." "The item name(s) - the brand name, or common name, functional name, generic name...."
* itemName.nameType 1..1 code "The type of name e.g. 'brand-name', 'functional-name', 'common-name'" "The type of name e.g. 'brand-name', 'functional-name', 'common-name'"
* itemName.language 1..1 code "The language of the item " "The language of the item "
* itemName.name 1..1 string "The name of the item " "The name of the item "
* marketingAuthorization 0..* BackboneElement "Marketing authorization" "Marketing authorization"
* marketingAuthorization.holder[x] 0..1 CodeableConcept or Reference "Responsible for the marketing authorization" "Responsible for the marketing authorization"
* marketingAuthorization.number 0..1 Identifier "Number or identifier of the marketing authorization" "Number or identifier of the marketing authorization"
* marketingAuthorization.validityPeriod 0..1 Period "Validity of the marketing authorization" "Validity of the marketing authorization"
* marketingAuthorization.issuer[x] 0..1 CodeableConcept or Reference "Issuer of the marketing authorization" "Issuer of the marketing authorization"
* marketingAuthorization.type 0..1 CodeableConcept " Type of marketing authorization, e.g. 'emergency use authorization' or 'regular'" " Type of marketing authorization, e.g. 'emergency use authorization' or 'regular'"
* marketingAuthorization.status 0..1 code "Status of the marketing authorization" "Status of the marketing authorization"
* description 0..1 BackboneElement "The description of the item" "The description of the item"
* description.language 0..1 code "The language of the item description" "The language of the item description"
* description.description 0..1 string "Textual description of the item" "Textual description of the item"
* dimensions 1..* BackboneElement "The dimensions" "The dimensions"
* dimensions.dimensionType 1..1 CodeableConcept "The type of dimension, e.g. 'length', 'height', 'volume', 'spherical volume', 'weight'" "The type of dimension, e.g. 'length', 'height', 'volume', 'spherical volume', 'weight'"
* dimensions.value 1..1 SimpleQuantity "The name of the item " "The name of the item "
* netContent 0..1 SimpleQuantity "Net content of the item" "Net content of the item"
* attributes 1..* BackboneElement "The attributes" "The attributes"
* attributes.attributeType 1..1 CodeableConcept "The type of attribute, e.g. ..." "The type of attribute, e.g. ..."
* attributes.value[x] 0..1 integer or string or boolean "The name of the item " "The name of the item "
* association 0..* BackboneElement "For example, Product A (powder) should be mixed with product B '(saline)', or 'product A should be applied with device B' , or 'Product X applies to parent device Y"
* association.associationType 1..1 CodeableConcept "The type of association" "e.g. 'applied with' or 'used with' or 'to be mixed with"
* association.associatedProduct[x] 1..1 CodeableConcept or Reference(model-product or model-item) "The associated product - by code or reference" "The associated product - by code or reference"
* association.associatedProductCodeableConcept from vs-ihe-pharm-product-association-type (preferred)
* association.quantity 1..1 Ratio "The quantity of the associated item in this item" "The quantity of the associated item in this item - Numerator is the quantity of the related item. Denominator is the quantity of the present item. For example a value of 20 means that this item contains 20 units of the related item; a value of 1:20 means the inverse - that the contained item contains 20 units of this item."
* classification 0..* CodeableConcept "The classification(s) of the product, e.g. ATC code, schedule, device class, ..." "The classification(s) of the product, e.g. ATC code, schedule, device class, ..."
* dosageForm 0..1 CodeableConcept "The code for the dose form of the pharmaceutical item" "The code for the dose form of the pharmaceutical item"
* dosageRecommendation 0..1 string "The stated recommended dosage of the item" "The stated recommended dosage of the item"
* routeofAdministration 0..1 CodeableConcept "The stated recommended route of administration" "The stated recommended route of administration"
* ingredients 0..1 BackboneElement "The item ingredients" "The item ingredients"
* ingredients.ingredient[x] 0..1 CodeableConcept or Reference "The ingredient" "The ingredient"
* ingredients.role 1..1 CodeableConcept "The role of the ingredient" "The role of the ingredient"
* ingredients.strength 1..1 Quantity "The strength of the ingredient" "The strength of the ingredient"
* storageandHandling 0..* BackboneElement "The Storage and Handling conditions for the item" "The Storage and Handling conditions for the item"
* storageandHandling.attributeType 1..1 CodeableConcept "The type of attribute, e.g. 'transport humidity', 'transport temperature', 'sunlight'" "The type of attribute, e.g. 'transport humidity', 'transport temperature', 'sunlight'"
* storageandHandling.value 0..1 Range "The value of the storage / handling parameter" "The value of the storage / handling parameter"




Logical: Product
Parent: Element
Id: model-product
Description: "This is the logical model for a Product"
* ^version = "0.3.0"
* ^status = #draft
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
* ^type = "Product"
* . ^short = "A functional description of a product’s functionality, used for counting"
* identifier 0..* Identifier "Business identifier for the product" "Business identifier for the product"
* baseUnitOfMeasure 0..1 CodeableConcept "The base unit of measure - the unit in which the product is used or counted." "The base unit of measure - the unit in which the product is used or counted."
* description 0..* BackboneElement "The type of counting - whether it is a manual counting, automated data capture, estimate.." "The type of counting - whether it is a manual counting, automated data capture, estimate.."
* description.attributeType 1..1 CodeableConcept "The type of operation - add/subtract" "The type of operation - add/subtract"
* description.attributeType[x] 1..1 integer or string or boolean "The value of the attribute" "The value of the attribute"
* association 0..* BackboneElement "For example, Product A (powder) should be mixed with product B '(saline)', or 'product A should be applied with device B' , or 'Product X applies to parent device Y"
* association.associationType 1..1 CodeableConcept "The type of association" "e.g. 'applied with' or 'used with' or 'to be mixed with"
* association.associatedProduct[x] 1..1 CodeableConcept or Reference(model-product or model-item) "The actual related product" "The actual related product"
* association.associatedProductCodeableConcept from vs-ihe-pharm-product-association-type (preferred)
* association.quantity 1..1 Ratio "The quantity of the associated product in this product" "The quantity of the associated product in this product - Numerator is the quantity of the related product. Denominator is the quantity of the present product. for example a value of 20 means that this product contains 20 units of the related product; a value of 1:20 means the inverse - that the contained product contains 20 units of this product."
* classification 0..* CodeableConcept "The classification(s) of the product, e.g. ATC code, schedule, device class, ..." "The classification(s) of the product, e.g. ATC code, schedule, device class, ..."
