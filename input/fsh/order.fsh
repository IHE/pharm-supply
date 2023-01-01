
Profile: IHESupplyRequest
Parent: SupplyRequest
Id: ihe-supply-request
Title: "Supply Request profile"
Description: "Profile for a Supply / Resupply Request"
* ^version = "0.1.0"
* ^status = #active
* status MS


Instance: sp-requested-item
InstanceOf: SearchParameter
Usage: #definition
Title: "Search Parameter - item requested"
Description: "Additional search parameter to search requests of specific items"
* url = "https://profiles.ihe.net/PHARM/supply/SearchParameter/sp-request-item"
* name = "RequestedItem"
* status = #active
* experimental = false
* date = "2022-12-05"
* description = "Search requests by product"
* jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* purpose = "Search requests by Product"
* code = #item
* base[+] = #SupplyRequest
* type = #token
* expression = "SupplyDelivery.suppliedItem.itemCodeableConcept"
* xpath = "f:SupplyDelivery/f:suppliedItem/f:itemCodeableConcept"
* xpathUsage = #normal