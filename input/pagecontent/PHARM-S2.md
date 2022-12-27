This section corresponds to transaction [PHARM-S2] of the IHE Technical Framework. Transaction [PHARM-S2] is used by the Supply Requester and the Supply Request Filler actors, to query for the status of supply requests.

### X:Y.Z.1 Scope

The Resupply Status [PHARM-S2] transaction queries the status of one or more supply requests.

### X:Y.Z.2 Actors Roles

**Table X:Y.Z.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Supply Requester](actor_definitions.html#supply-requester)    | Query status of SupplyRequests from a Supply Request Filler |
| [Supply Request Filler](actor_definitions.html#supply-request-filler) | Provides the status of SupplyRequests to the Supply Requester |
{:.table-bordered .table-sm}


### X:Y.Z.3 Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### X:Y.Z.4 Messages

<figure>
{% include pharm-s2.svg %}
</figure>



**Figure X:Y.Z.4-1: Supply Status Interactions**

#### X:Y.Z.4.1 Supply Status request
The Supply Status transaction is initiated by the Supply Requester. This request is a query to check for the status of an individual request, or several requests at once - if allowed.


##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the Supply Requester intends to query the Supply Request Filler about the status of the requests presented by the same Supply Requester or by another entity for which the Supply Request Filler is allowed to get updates.

##### X:Y.Z.4.1.2 Message Semantics

The content type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

The Supply Request Filler SHALL assure the request is consistent and actionable before any response, i.e. all authorizations and approvals are present. 

###### X:Y.Z.4.1.2.1 Resource content

The following search parameters SHALL be supported by the Supply Request Filler actor - **but not necessarily supported for all queries**, see confidentiality note below:

| parameter | meaning | notes |
| --- | --- | --- |
| identifier | request order by the assigned identifiers (placer identifiers or filled identifiers)||
| receiver | request orders by the intended receiver | |
| item - | request the status of the orders for specific items or products | using the search parameter [RequestedItem](SearchParameter-sp-requested-item.html)|
| patient | request orders for a specific patient | NOTE: Even in a request, this parameter may expose personal patient identifiers and should therefore be subject to strict validation |
| supplier |request orders that are intended to be supplied or handled by a specific entity||
{:.table-bordered .table-sm}

The server SHALL ensure that the receiver is allowed to query the requests, given the policies and rules to ensure confidentiality and prevent exposure of unwanted information.
For example each organization can only search by `receiver` if that organization is the receiver itself or somehow allowed to see the requests for the receiver. Failing to protect this information would expose potentially confidential information to other organizations.


##### X:Y.Z.4.1.3 Expected Actions
Upon receiving a well-formed request, the Supply Request Filler actor

1. SHALL validate the request:
  * Check that the request contains any unsupported parameters
  * Check that the request contains only supported parameters AND the requester uses only valid values, e.g. populating the parameter `receiver` only with values that the requester is allowed to see

2. SHALL perform the query, using the aplicable business rules

3. MAY do additional processing e.g. checking that the response itself does not expose unwanted data, e.g. any patient information that is not intended to be presented to the requester 

4. Present the response to the requester.
  * If the request contains invalid parameters or is otherwise not correct, present a status code and response

5. Log the request in the audit logs



#### X:Y.Z.4.2 Supply Request Response
The Supply Request Filler always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the Supply Requester with the ackowledgement and response to the request.
The response shall immediately follow the request. In case any delayed validation of the Supply Request Filler is expected (for example manual verification of the status of the orders), such validation shall not impede the immediate response to the Supply Requester. 

##### X:Y.Z.4.1.2 Message Semantics

The response to a Supply Request Status request shall consist of:

* In case the status request is accepted, the response shall have the response code `200 (OK)` and the [FHIR Bundle of type Search Result](http://hl7.org/fhir/bundle.html), 
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/http.html) for information on error handling)
* Implementers of the Supply Request Filler actor SHALL implement the verification of business rules concerning query parameters, and return the corresponding response codes for any requests accordingly.
* In case the Supply Request Filler needs to perform additional verification, the response SHOULD  contain a specific status code like `202 (Accepted)` and no further information fot the moment.

##### X:Y.Z.4.1.3 Expected Actions
The Supply Request Status is informative for the Supply Requester, so no specific actions are required.
