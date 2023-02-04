This section corresponds to transaction [PHARM-S4] of the IHE Technical Framework - Receipt notice. Transaction [PHARM-S4] is used by the Supply Supplier and the Supply Receiver actors. The Receipt notice [PHARM-S4] transaction is used to inform that items have been received at a given location.

### X:Y.Z.1 Scope

With the Receipt notice [PHARM-S4] transaction, the Receiver informs the Supplier (any receiver of information, not necessarily the materials supplier) about the Receipt of items, including updates.
The Receipt (and respective notice) can be related to a Shipment Notive and a Supply Request, or can be unrelated in case of unexpected reception of items, or items for which an order was not made and the Shipment notice is not digitally available. 

### X:Y.Z.2 Actors Roles

**Table X:Y.Z.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Receiver](actor_definitions.html#receiver) | Sends Receipt notice to the Supplier |
| [Supplier](actor_definitions.html#supplier) | Receives the Receipt notice|
{:.table-bordered}

### X:Y.Z.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### X:Y.Z.4 Messages

<figure>
{% include pharm-s4.svg %}
</figure>



**Figure X:Y.Z.4-1: Supply Request Interactions**

#### X:Y.Z.4.1 Supply Request Request Message
The Receiver sends a SupplyDelivery resource (conformant to the [Supply Receipt Profile](StructureDefinition-ihe-supply-receipt-notice.html)) using the POST method to the Supplier endpoint.

##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the Receiver wishes to notify another entity of the reception of items. 

##### X:Y.Z.4.1.2 Message Semantics

The content type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

The Receiver shall assure the request is consistent and actionable before sending, i.e. all required authorizations and approvals are present.

###### X:Y.Z.4.1.2.1 Resource content


##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the Receipt notice, the Supplier will act and distribute the information accordingly. Some examples of possible actions:
* Distribute / forward the Receipt notice to any other parties e.g. for delivery tracking purposes
* Update expected/planned inventory
* Trigger or prepare or update the billing


#### X:Y.Z.4.2 Supply Request Response
The Supplier always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the Receiver with the ackowledgement of the Receipt notice, including any technical issues.
The response shall immediately follow the Receipt note reception.
In case any delayed updates and confirmation is triggered expected, such actions shall not impede the immediate response to a Receipt notice.

##### X:Y.Z.4.1.2 Message Semantics

The response to a Supply Request shall consist of:
* In case the request is accepted, the response shall have the response code `201 (Created)`
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/R4B/http.html) for information on error handling)


###### X:Y.Z.4.1.2.1 Resource content

* When the receipt notice is accepted, the response shall contain the resource that has been created from the reception of the notice, including the id, version, etc. as assigned by the server. This allows the Receiver to confirm the the receipt notice has been accepted and track any subsequent actions if needed.
* In case of error, the response should contain an OperationOutcome providing more information about the issue.

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the response to the Receipt notice, the Supplier can persist the information provided by the Receiver (status, id, etc.) for future tracking, and can trigger a response to any issues, if they exist.

