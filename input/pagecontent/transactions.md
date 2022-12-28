

### Dispense Request
For triggering the supply associated (or not) with a prescription, there may be a dispense request. This is not the original prescription - it can differ in terms of quantity, contain additional details, or handle requesting products from different locations. The Dispense Request is therefore a transaction that focuses exclusively on the logistic supply of products for a patient, and may be triggered from a clinical prescription but is not a clinical prescription. 
This mechanism of Dispense Request is not detailed here separately. Technically, it is very similar to the Supply Request and can be an instance of that.

### S1. Supply Request

The Supply request handles a request to the party that will process, authorize and otherwise handle the request. This may be or not the supplier: In some cases the request may be to an authorizing party, or another management system, which plays no part in the actual delivery.

The resupply request typically may contain information about:

|Actor|Role description|
|----|----|
|Request ID| identification of the request| 
|Status | status of the request | 
|DateTime | date/time of the request | 
|Requester ID | identification of the requester | 
|Original request | the original request that this request is based on | 
|Intended Request Filler ID| identification of the intended request filler, i.e. who the request is addressed to| 
|Requested item(s)|  the actual items being requested| 
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Item Identification| the identifier(s) of the requested item | 
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quantity| Amount of items | 
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Item Info |Any traceability information if needed – for example requesting a specific lot.| 
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Origin | Location where the item should be delivered or placed|
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Origin location | Location or source of the item|
|Destination | the destination of the items to be supploied | 
|Fulfilled request ID | when a request is a response to other requests, e.g. compilation of different requests to buy in bigger quantities|
|Reason | Rationale and reference for resupply, e.g., upstream requests or events, like the prescription that has to be fulfilled, or the stock depleted|
|Notes | Data needed for distribution – e.g., billing modes, etc.|
{:.table-bordered .table-sm}


Also see the [data model overview below](#overall-data-requirements)

___


### S2. Supply Request Status

The Supply Request is used to inform a party about the request of items and the status of such request and its handling. This can be in response to a request, or as an immediate response to the order, or unsolicited.

The data that is normally present is the same as the [supply request](#supply-request):


___

### S3. Shipment notice
The shipment notice informs other parties that the actual shipment is initiated. This typically means that the items are now in transport. 


This data is normally used:

* Supplier ID
* Receiver ID
* Shipment ID
* Sending party location
* Receiving party location
* Sent items
  * Identification of the item
  * Physical item characteristics e.g., lot number etc.
  * Quantity
* Other info e.g. original request identification

___

### Delivery/Receipt notice
The delivery or receipt notice is used to inform the parties about the reception of items. This can be used to confer quantities, inform of delivery issues, and is commonly used to activate the billing, since the reception of items signals that the items are now in the custody of the receiver, so if all is ok, the order can be billed when it is finally received at its destination.

The following data is commonly present in the delivery notice:

* Supplier ID
* Receiver ID
* Shipment ID
* Sending party location
* Receiving party location
* Sent items
  * Identification of the item
  * Physical item characteristics e.g., lot number etc.
  * Quantity items received (can be detailed by status e.g. items received, items damaged…)
* Other info e.g. original request identification 


___

### Inventory Status report
The inventory status report updates the parties about the status of inventory - quantities available etc.
This can be divided in different dimensions: Snapshot vs Differential - the former is an information about the current product count in a position, while the latter informs about differences to a previous count (e.g. additions, subtractions). 

The data involved is usually this:

* Identification of the Request
* Date and time
* Inventory entries
  * Location
  * Content
  * Items
    * Physical attributes (lot, machine-readable content, etc.)
    * Quantity
* Identification of the reporter


### Inventory Consumption
One of the key aspects of the materials handling is that sometimes products are consumed but not used or reported clinically. For example items that are dropped or damaged, and/or need to be wasted - will not be reported in the clinical information exchange, but are important to be notified for proper inventory control. This consumption report can contain information such as:
* Stock Location
* Reporter ID
* Patient ID, if applicable
* Consumed items
  * Identification of the item
  * Physical item characteristics e.g., lot number etc.
  * Quantity
* Other information that may be relevant for the adequate processing of the consumption information

___

### Overall data requirements
The data needs for the different transactions are represented in the following diagram.
  <figure>
    {% include models.svg %}
  </figure>

The **Supply Request** provides the data necessary to initiate an order. The status of a **Supply Request** may be inquired and the result is represented by a **Supply Request Status** which represents the updates of a **SupplyRequest** and is therefore a specialization fo the **Supply Request** data needs.  
The fulfillment of a **Supply Request** may result in a shipment, which is represented as a **Shipment Notice** which references the request that originated it. The **Receipt Notice** can be used to track what is actually received at the destination or in transit. The data it contains is quite similar to a shipment notice and in fact the **Receipt Notice** can be seen as a specialization of the **Shipment Notice**.
For Inventory, the **Inventory Status** provides the partial or complete inventory in a position, and can be used to represent absolute status, or differential status to a revious report, for example to inform that some units have been deducted from stock since last count.
This latter possibility is the same as an **Inventory Consumption** report, which is thus a specialization of the **Inventory Status**.



___

### Delivery authorization request
The delivery authorization request is used for a party to request the issuance of a delivery authorization. This is mostly necessary in the case of returns, where the initiator (the consumer) requests the delivery authorization from the supplier, so that the supplier authorizes the return of the products. This is equivalent to a Return Material Authorization form - not the authorization itself, but the form to request it.
The following data is considered most relevant in the delivery authorization request:
* Requester ID
* Receiver ID
* Items requested to be sent
  * Identification of the item
  * Physical item characteristics e.g., lot number etc.
  * Quantity
  
___

### Delivery authorization
The delivery authorization informs parties that a given delivery is authorized (typically a return). This is commonly referred to as a Return Material Authorization. 
It normally contains the following information:

* Requester ID
* Receiver ID
* Authorization ID
* Items allowed to be sent
  * Identification of the item
  * Physical item characteristics e.g., lot number etc.
  * Quantity

