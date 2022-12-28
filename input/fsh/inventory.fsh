// Profile: InventoryReport
// Parent: InventoryStatus
// Id: ihe-inventory-report
// Title: "Inventory Report"
// Description: "Inventory Report (snapshot)"
// * ^version = "0.1.0"
// * ^status = #active
// * status MS

ValueSet: ProductAssociationType
Id: vs-ihe-pharm-product-association-type
Title: "Product association type Value Set"
Description: "Product association type Value Set"
* ^status = #draft
* ^version = "0.1.0"
* ^url = "https://profiles.ihe.net/PHARM/supply/ValueSet/vs-ihe-pharm-product-association-type"
* include codes from system CSProductAssociationType



CodeSystem: CSProductAssociationType
Id:         cs-ihe-pharm-product-association-type
Title: "Product association type code system"
Description: "product association type code system."
* ^url = https://profiles.ihe.net/PHARM/Supply/CodeSystem/cs-ihe-pharm-product-association-type
* #contains "contains" "the product contains the related product"

