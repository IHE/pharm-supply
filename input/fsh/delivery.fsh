
Profile: IHESupplyDispatchNotice
Parent: SupplyDelivery
Id: IHESupplyDispatchNotice
Title: "Profile - Supply Shipment Notice"
Description: "A notification of shipment or beginning of transport of supply items."
* ^url = "http://profiles.ihe.net/PHARM/supply/StructureDefinition/DispatchNotice"
* ^version = "0.2.0"
* ^status = #active
* identifier MS
* extension contains IHEDeliveryStage named deliveryStage 1..1
* extension[deliveryStage].valueCodeableConcept = IHEDeliveryStageCS#shipment (exactly) // why is this not showing in the instance?


Profile: IHESupplyReceiptNotice
Parent: SupplyDelivery
Id: IHESupplyReceiptNotice
Title: "Profile - Supply Receipt Notice"
Description: "A notification of reception of supply items."
* ^url = "http://profiles.ihe.net/PHARM/supply/StructureDefinition/ReceiptNotice"
* ^version = "0.2.0"
* ^status = #active
* identifier MS
* extension contains IHEDeliveryStage named deliveryStage 1..1
* extension[deliveryStage].valueCodeableConcept = IHEDeliveryStageCS#reception (exactly) // why is this not showing in the instance?


Extension: IHEDeliveryStage
Id: IHEDeliveryStageExt
Title: "Supply delivery stage extension"
Description: "Stage of delivery reported in a SupplyDelivery."
* ^context[+].type = #element
* ^context[=].expression = "SupplyDelivery"
* value[x] only CodeableConcept
* value[x] from IHEDeliveryStageVS (required)


ValueSet: IHEDeliveryStageVS
Id: IHEDeliveryStageVS
Title: "Supply delivery stage value set"
Description: "Supply delivery stage value set."
* ^copyright = "© 2022+ IHE International"
* ^experimental = true

* include codes from system IHEDeliveryStageCS


CodeSystem: IHEDeliveryStageCS
Id:         IHEDeliveryStageCS
Title: "Supply delivery stage code system"
Description: "Supply delivery code system."
* ^experimental = true
* ^caseSensitive = true
* ^url = "http://profiles.ihe.net/PHARM/supply/CodeSystem/DeliveryStageCS"
* #shipment
    "Shipment"
    "The event is the shipment of the item."
* #reception
    "Reception"
    "The event is the reception of the item."

