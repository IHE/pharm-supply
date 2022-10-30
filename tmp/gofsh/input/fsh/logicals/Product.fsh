Logical: Product
Parent: Element
Id: model-product
Description: "This is the logical model for a Product"

* ^type = "Product"
* . ^short = "A functional description of a product’s functionality, used for counting"
* identifier 0..* Identifier "Business identifier for the product" "Business identifier for the product"
* baseUnitOfMeasure 0..1 CodeableConcept "The base unit of measure - the unit in which the product is used or counted." "The base unit of measure - the unit in which the product is used or counted."
* description 0..* BackboneElement "The type of counting - whether it is a manual counting, automated data capture, estimate.." "The type of counting - whether it is a manual counting, automated data capture, estimate.."
  * attributeType 1..1 CodeableConcept "The type of operation - add/subtract" "The type of operation - add/subtract"
  * attributeType[x] 1..1 integer or string or boolean "The value of the attribute" "The value of the attribute"
* association 0..* BackboneElement "For example, Product A (powder) should be mixed with product B '(saline)', or 'product A should be applied with device B' , or 'Product X applies to parent device Y"
  * associationType 1..1 CodeableConcept "The type of association" "e.g. 'applied with' or 'used with' or 'to be mixed with"
  * associatedProduct 1..1 Reference(https://www.ihe.net/fhir/StructureDefinition/model-product or https://www.ihe.net/fhir/StructureDefinition/model-item) "The actual related product" "The actual related product"
  * associatedProduct from https://www.ihe.net/fhir/ValueSet/pharm-product-association-type (preferred)
  * quantity 1..1 Ratio "The quantity of the associated product in this product" "The quantity of the associated product in this product - Numerator is the quantity of the related product. Denominator is the quantity of the present product. for example a value of 20 means that this product contains 20 units of the related product; a value of 1:20 means the inverse - that the contained product contains 20 units of this product."
* classification 0..* CodeableConcept "The classification(s) of the product, e.g. ATC code, schedule, device class, ..." "The classification(s) of the product, e.g. ATC code, schedule, device class, ..."