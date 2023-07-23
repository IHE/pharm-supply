This section corresponds to transaction [PHARM-S6] of the IHE Technical Framework - Inventory Usage  Report. Transaction [PHARM-S6] is used by the Inventory Reporter and the Inventory Manager actors to inform updates of an inventory position - consumption, updates.

### X:Y.Z.1 Scope

The Inventory Status Report [PHARM-S6] transaction is used to inform about changes in the inventory in a physical location, or a selected set of items for which the inventory update is issued.

#### Common cases covered 
The following cases are covered with this transaction:

This transaction allows the Inventory Reporter to send updates to an Inventory Manager about known changes in the inventory, so that the Inventory Manager can track the inventory count more accurately.  
Common cases are:

* When a medication is taken from inventory but is not administered (for example falling on the floor)
* When a multidose or multiuse product is consumed - or example when a jar of cream is used up, or a new one is taken from stock to be used by a patient
* When products are disposed of locally - but not handed over for disposal. If a product is handed over, this is a SupplyDelivery.

Note that this transaction could also be used to report "negative consumption" e.g. return of items, or correction of wastage, but the transaction "Supply Delivery" should aways be preferred when possible. 

### X:Y.Z.2 Actors Roles

**Table X:Y.Z.2-1: Actor Roles**

|Actor | Role |  
|------|------|
| [Supply Requester](actors_and_transactions.html#supply-requester)    | Sends Supply Requests to the Supply Request Filler |
| [Supply Request Filler](actors_and_transactions.html#supply-request-filler) | Accepts the request sent from the Supply Requester |
{:.table-bordered}


### X:Y.Z.3 Referenced Standards

**FHIR-R5** [HL7 FHIR Release 5.0](http://www.hl7.org/FHIR/R5)

### X:Y.Z.4 Messages

<figure>
{% include pharm-s6.svg %}
</figure>


**Figure X:Y.Z.4-1: Inventory Status Report Interactions**

#### X:Y.Z.4.1 Inventory Status Report Message

<blockquote class="stu-note" id="not-yet-available">
	<strong>This transaction is not implementable in FHIR versions below 5.0 so it is not further detailed in this current release of the profiles.</strong>
	Readers are invited to provide feedback about the urgency, needs and current challenges that IHE should solve.
</blockquote>
</div>

The Inventory Reporter submits an InventoryReport resource instance that conforms to the [InventoryStatusReport](#not-yet-available) profile using the POST method to the /InventoryReport endpoint.

##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the Inventory Reporter has updated information to report about the current inventory of one or several positions, e.g. after a monthly count, or daily after recalculating expected existences... 

##### X:Y.Z.4.1.2 Message Semantics

The content type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

The Inventory Reporter shall assure the report is consistent before sending, i.e. all authorizations and approvals are present. 

###### X:Y.Z.4.1.2.1 Resource content


##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the Inventory Status Report, the Inventory Manager can decide the actions like reporting, deciding on reordering, etc. 





#### X:Y.Z.4.2 Supply Request Response
The Inventory Manager always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the inventory Reporter with the ackowledgement of the Inventory Status Report, including any technical issues.
The response shall immediately follow the Inventory Status Report.


##### X:Y.Z.4.1.2 Message Semantics

The response to a Inventory Status Report shall consist of:
* In case the report is accepted, the response shall have the response code `201 (Created)`
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/R5/http.html) for information on error handling)


###### X:Y.Z.4.1.2.1 Resource content

* When the Inventory Status Report is accepted (regardless of whether it may be acted upon), the response shall contain the resource that has been created from the Inventory Status Report, including the id, version, etc. as assigned by the server. This allows the Inventory Reporter to confirm what has been accepted.
* In case of error, the response should contain an OperationOutcome providing more information about the issue.

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the response to the Inventory Status Report, the Inventory Manager can persist the information provided by the Inventory Status Report (status, id, etc.) for future tracking, and can trigger a response to any issues, if they exist.

