

Profile: SupplyShipmentNotice
Parent: SupplyDelivery
Id: ihe-supply-shipment-notice
Title: "Profile - Supply Shipment Notice"
Description: "A notification of shipment or beginning of transport of supply items."
* ^url = "http://ihe.net/fhir/PHARM/supply/StructureDefinition/ihe-supply-shipment-notice"
* ^version = "0.2.0"
* ^status = #active
* identifier MS
* extension contains DeliveryStage named deliveryStage 1..1
* extension[deliveryStage].valueCodeableConcept = #shipment (exactly) // why is this not showing in the instance?


Profile: SupplyReceiptNotice
Parent: SupplyDelivery
Id: ihe-supply-receipt-notice
Title: "Profile - Supply Shipment Notice"
Description: "A notification of shipment or beginning of transport of supply items."
* ^url = "http://ihe.net/fhir/PHARM/supply/StructureDefinition/ihe-supply-shipment-notice"
* ^version = "0.2.0"
* ^status = #active
* identifier MS
* extension contains DeliveryStage named deliveryStage 1..1
* extension[deliveryStage].valueCodeableConcept = #reception (exactly) // why is this not showing in the instance?


Extension: DeliveryStage
Description: "Body side of a body location."
* value[x] only CodeableConcept
* value[x] from DeliveryStageVS (required)


ValueSet: DeliveryStageVS
Id: delivery-stage-vs
Title: "Supply delivery stage value set"
Description: "Supply delivery stage value set."
* ^copyright = "© 2022+ IHE International"
* include codes from system DeliveryStageCS


CodeSystem: DeliveryStageCS
Id:         delivery-stage-cs
Title: "Supply delivery stage code system"
Description: "Supply delivery code system."
* ^url = https://profiles.ihe.net/PHARM/Supply/CodeSystem/DeliveryStageCS
* #shipped
    "Shipment"
    "Information is about the shipment of the item."
* #reception
    "Reception"
    "Information is about the reception of the item."
