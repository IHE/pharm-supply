This section corresponds to transaction [PHARM-S3] of the IHE Technical Framework - Shipment notice. Transaction [PHARM-S3] is used by the Supply Supplier and the Supply Receiver actors. The Shipment notice [PHARM-S3] transaction is used to inform that items have been sent.

### X:Y.Z.1 Scope

With the Shipment notice [PHARM-S3] transaction, the Supplier informs the Receiver (the receiver of information, not necessarily the receiver of the supply) about the shipment of items, including updates.
The shipment (and respective notice) can be related to a Supply Request, or can be unrelated - some shipments are sent even without an supply order (for example consignment items which are supplied upon consumption, or in the case of vendor-managed inventory. See the IHE Supply Whitepaper for more details on the use cases). 

### X:Y.Z.2 Actors Roles

**Table X:Y.Z.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Supplier](actor_definitions.html#supplier) | Sends Shipment notice to the Receiver |
| [Receiver](actor_definitions.html#receiver) | Receives the Shipment notice |
{:.table-bordered}

### X:Y.Z.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### X:Y.Z.4 Messages

<figure>
{% include pharm-s3.svg %}
</figure>



**Figure X:Y.Z.4-1: Supply Request Interactions**

#### X:Y.Z.4.1 Supply Request Request Message
The Supplier sends a SupplyDelivery resource using the POST method to the Receiver endpoint.

##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the Supplier wishes to notify another entity of the shipment of items. 

##### X:Y.Z.4.1.2 Message Semantics

The content type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

The Supplier shall assure the request is consistent and actionable before sending, i.e. all authorizations and approvals are present.

###### X:Y.Z.4.1.2.1 Resource content


##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the Shipment notice, the Receiver will act and distribute the information accordingly. Some examples of possible actions:
* Distribute / forward the shipment notice to any other parties e.g. for delivery tracking purposes
* Update expected/planned inventory
* Trigger or prepare any billing processes





#### X:Y.Z.4.2 Supply Request Response
The ... always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the Supplier with the ackowledgement of the Shipment Notice including any technical issues.
The response shall immediately follow the Shipment Notice.

##### X:Y.Z.4.1.2 Message Semantics

The response to a shipment notice shall consist of:
* In case the shipment notice is accepted, the response shall have the response code `201 (Created)`
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/R4B/http.html) for information on error handling)


###### X:Y.Z.4.1.2.1 Resource content

* The response to a shipment notice shall contain the resource that has been created, including the id, version, identifiers, etc. as assigned by the server. This allows the Receiver to confirm what has been accepted and track the shipment notice on that server by its internal `id` or other identifiers.
* In case of error, the response should contain an OperationOutcome providing more information about the issue.

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the response to the Shipment Notice, the Receiver can persist the information provided by the Shipment Notice (status, id, etc.) for future tracking, and can trigger a response to any issues, if they exist.

