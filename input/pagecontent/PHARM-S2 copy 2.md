This section corresponds to transaction [PHARM-S1] of the IHE Technical Framework. Transaction [PHARM-S1] is used by the Supply Requester and the Supply Request Filler actors. The Supply Request [PHARM-S1] transaction is used to transmit an order for supply of products.

### X:Y.Z.1 Scope

The xxxxxxxxx [PHARM-S2] transaction passes a xxxxxx from a xxxxxx to a xxxxxxx.

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
{% include pharm-s2.svg %}
</figure>



**Figure X:Y.Z.4-1: Supply Request Interactions**

#### X:Y.Z.4.1 Supply Request Request Message
The ..... submits a ...... resource using the ..... method to the /..... endpoint.

##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the .... needs to submit one or more ..... to a .... - to inform, to request ..... 

##### X:Y.Z.4.1.2 Message Semantics

The content type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

The ..... shall assure the request is consistent and actionable before sending, i.e. all authorizations and approvals are present. 

###### X:Y.Z.4.1.2.1 Resource content

* 

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the 










#### X:Y.Z.4.2 Supply Request Response
The ... always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the ..... with the ackowledgement of the ....including any technical issues.
The response shall immediately follow the .....
In case any delayed validation of the .... is expected, such validation shall not impede the immediate response to a ....... 

##### X:Y.Z.4.1.2 Message Semantics

The response to a Supply Request shall consist of:
* In case the request is accepted, the response shall have the response code `201 (Created)`
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/R4B/http.html) for information on error handling)


###### X:Y.Z.4.1.2.1 Resource content

* When the request is accepted (regardless of whether it may be acted upon), the response shall contain the resource that has been created from the request, including the id, version, etc. as assigned by the server. This allows the ..... to confirm what has been accepted and track the request on that server by its internal `id`.
* In case of error, the response should contain an OperationOutcome providing more information about the issue.

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the response to the ...., the ... can persist the information provided by the ..... (status, id, etc.) for future tracking, and can trigger a response to any issues, if they exist.

