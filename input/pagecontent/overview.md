### Overview
The use cases in this specification reveal a series of requirements that, combined, provide a set of basic interoperability mechanisms - actors, transactions, and respective content. These common mechanisms can be combined in the different combinations exposed in the use cases, and cover the foreseeable range and combination of other use cases. 

This interoperability specification uses the following modules:
* **Ordering** - handling the ordering process and its handling
* **Delivery** - handling the delivery of items independently of the ordering that may have triggered it
* **Inventory management** - tracking current inventory and inventory changes
* **Return** - handling the return of products e.g. recalled items or damaged items
* **Product information** - consulting product information - product characteristics for ordering or tracking, or tracking past history of items for example to perform validity or falsification checking.

The separation of ordering and delivery workflows is important to handle the common workflow variation:
The order workflow typically includes exchanging information among the entities that play a role in the approval and preparation of the order itself; 
The delivery workflow includes exchanging information across parties that are involved in the actual physical handling of the products.
For example: 
An order is sent from a local pharmacy to a central pharmacy. Then the order goes for procurement for approval, and then for the distributor who initiates the order to the actual supplier.
The delivery follows a different path: From the supplier, it goes to the central warehouse, then the local distribution center, and from there directly to the storage near the local pharmacy. 
The actors that exchange information are not the same in the ordering and delivering path, and this allows more flexibility in the supply and business processes.


The actors and data exchange mechanisms considered in this specification are described in the [actor_definitions.html](Actor definitions) page.


<br/>
