
Profile: IHESupplyShipmentNotice
Parent: SupplyDelivery
Id: ihe-supply-shipment-notice
Title: "Profile - Supply Shipment Notice"
Description: "A notification of shipment or beginning of transport of supply items."
* ^url = "http://profiles.ihe.net/PHARM/supply/StructureDefinition/ihe-supply-shipment-notice"
* ^version = "0.2.0"
* ^status = #active
* identifier MS
* extension contains IHEDeliveryStage named deliveryStage 1..1
* extension[deliveryStage].valueCodeableConcept = IHEDeliveryStageCS#shipment (exactly) // why is this not showing in the instance?


Profile: IHESupplyReceiptNotice
Parent: SupplyDelivery
Id: ihe-supply-receipt-notice
Title: "Profile - Supply Receipt Notice"
Description: "A notification of reception of supply items."
* ^url = "http://profiles.ihe.net/PHARM/supply/StructureDefinition/ihe-supply-receipt-notice"
* ^version = "0.2.0"
* ^status = #active
* identifier MS
* extension contains IHEDeliveryStage named deliveryStage 1..1
* extension[deliveryStage].valueCodeableConcept = IHEDeliveryStageCS#reception (exactly) // why is this not showing in the instance?


Extension: IHEDeliveryStage
Id: ihe-ext-delivery-stage
Description: "Stage of delivery reported in a SupplyDelivery."
* ^context[+].type = #element
* ^context[=].expression = "SupplyDelivery"
* value[x] only CodeableConcept
* value[x] from IHEDeliveryStageVS (required)


ValueSet: IHEDeliveryStageVS
Id: delivery-stage-vs
Title: "Supply delivery stage value set"
Description: "Supply delivery stage value set."
* ^copyright = "© 2022+ IHE International"
* ^experimental = true

* include codes from system IHEDeliveryStageCS


CodeSystem: IHEDeliveryStageCS
Id:         delivery-stage-cs
Title: "Supply delivery stage code system"
Description: "Supply delivery code system."
* ^experimental = true
* ^caseSensitive = true
* ^url = http://profiles.ihe.net/PHARM/supply/CodeSystem/delivery-stage-cs
* #shipment
    "Shipment"
    "Information is about the shipment of the item."
* #reception
    "Reception"
    "Information is about the reception of the item."

