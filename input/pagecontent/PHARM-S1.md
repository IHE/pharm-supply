This section corresponds to transaction [PHARM-S1] of the IHE Technical Framework. Transaction [PHARM-S1] is used by the Supply Requester and the Supply Request Filler actors. The Supply Request [PHARM-S1] transaction is used to transmit an order for supply of products.

### X:Y.Z.1 Scope

The Supply Request [PHARM-S1] transaction passes a Supply Request from a Supply Requester to a Supply Request Filler.

### X:Y.Z.2 Actors Roles

**Table X:Y.Z.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Supply Requester](actor_definitions.html#supply-requester)    | Sends Supply Requests to the Supply Request Filler |
| [Supply Request Filler](actor_definitions.html#supply-request-filler) | Accepts the request sent from the Supply Requester |
{:.table-bordered}

### X:Y.Z.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### X:Y.Z.4 Messages

<figure>
{% include pharm-s1.svg %}
</figure>


**Figure X:Y.Z.4-1: Supply Request Interactions**

#### X:Y.Z.4.1 Supply Request Request Message
The Supply Requester submits a SupplyRequest resource using the HTTP POST method to the /SupplyRequest endpoint.

##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the Supply Requester needs to submit one or more Supply Requests to a Supply Request Filler - to inform, to request approval, or to initiate a delivery. 

##### X:Y.Z.4.1.2 Message Semantics

The content type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

The Supply Requester shall assure the request is consistent and actionable before sending, i.e. all authorizations and approvals are present. 

###### X:Y.Z.4.1.2.1 Resource content

* The supply request is a SupplyDelivery resource.
The semantics of the request and data elements are captured in the [Supply Request Data Model](StructureDefinition-model-supply-request.html) constraints in the [Supply Order](StructureDefinition-ihe-supply-request.html) profile.

Notes
* RequestID
* The items to be ordered are expressed as the product code. When details about the product need to be expressed in a structured manner, the `parameter` element should be used. A reference to a resource can also be used (Medication, Device, etc.). In that case, the resource can be contained in the request. See [References](https://hl7.org/fhir/R4/references.html#contained) about contained resources.


##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the Supply Request, the Supply Request Filler is expected to have all the information required to respond - approve, forward, or otherwise act upon the request.
The Supply Request Filler shall issue a response confirming the request has been accepted (created), or informing of any error. 









#### X:Y.Z.4.2 Supply Request Response
The Supply Request Filler always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the Supply Requester with the ackowledgement of the request including any technical issues.
The response shall immediately follow the request.
In case any delayed validation of the order is expected, such validation shall not impede the immediate response to a Supply Request. Such delayed information can be conveyed as a Supply Request Status which is covered by the [[PHARM-S2]](PHARM-S2.html) transaction.


##### X:Y.Z.4.1.2 Message Semantics

The response to a Supply Request shall consist of:
* In case the request is accepted, the response shall have the response code `201 (Created)`
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/R4B/http.html) for information on error handling)


###### X:Y.Z.4.1.2.1 Resource content

* When the request is accepted (regardless of whether it may be acted upon), the response shall contain the resource that has been created from the request, including the id, version, etc. as assigned by the server. This allows the Supply Requester to confirm what has been accepted and track the request on that server by its internal `id`.
* In case of error, the response SHALL contain an OperationOutcome providing more information about the issue.

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the response to the Supply Request, the Supply Requester can persist the information provided by the Supply Request Filler (status, id, etc.) for future tracking, and can trigger a response to any issues, if they exist.

