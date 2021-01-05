The [IHE Supply white paper](https://www.ihe.net/uploadedFiles/Documents/Pharmacy/IHE_PHARM_WP_Supply_Rev1-0_PC_2019-11-18.pdf#page=97) described 
the data exchange mechanisms needed to suport the variety of use cases - floor stock, consignment items, etc.
This profile provides the technical specifications for those mechanisms.


### Supply
One of the conclusions of the IHE Supply white paper is the separation of "supply" in key areas: **supply ordering** and **supply delivery**.
This means that the interactions concerning a supply order may be completely independent of the deliveries.
This is expectable in many scenarios. The ordering process may follows a chain of approvers and suppliers, whereas the actual delivery
follows a different chain. 
For example, a hospital location may send an order to a central pharmacy, which then follows to the purchasing department, and then to the selected supplier who may have a set of retailers available.
The delivery information, however, will be shared from the selected supplier, to the actual distributor, to the transport company, and to the purchasing department directly.
This means that the requests and respective response may follow a path that differs from the path followed by the delivery information.


#### Supply Orders
For the supply request, two actors are considered: 
* Requester
* Request Filler, an actor that has will participate in fulfilling the request

**These actors are expected to be chained - in a specific implementation, a system can be both a Requester and a Request Filler.** For example a Central Pharmacy 
receives requests from wards or remote pharmacies, and sends approved/updated requests to the supplier or distributor (thus acting as a Request Filler and Requester in the same process).


The Supply Ordering process requires the following interfaces:
* A __Requester__ issues a request for resupply of items. This request is sent to a __Request Filler__.  
The request can be triggered by one of several events - periodic reordering, minimum reached, etc.
* The __Request Filler__ sends an update to a __Requester__ about the status of a request.  
This update can also happen upon several triggers: immediately after the reception of a request, or upon a query from a requester, or after any internal trigger. 

<img src="supply_request.png" width="60%"/>
<br clear="all"/>

#### Delivery

The delivery considers two actors: 
* Item Supplier, an actor that sends or forwards the items to a receiver 
* Receiver, the destination of the items.

**These actors are also expected to be chained in any implementation**. For example, a warehouse (as a __Supplier__) sends items to a retailer (__Receiver__) who then send them (now as a _Supplier__) to the Central Pharmacy (__the new __Receiver_).


<img src="supply_delivery.png" width="60%"/>
<br clear="all"/>

<br/>


### Inventory

The Inventory Management is achieved with two essential mechanisms: Inventory status updates, and inventory consumption.

#### Inventory status updates
Inventory status updates concerns the monitoring and reporting of inventory locations - i.e. the availability (or not) of inventory items. The actors are:
* The __Inventory Reporter__ contains and information about the inventory in a location  
This actor is typically implemented by systems associated with one or several inventory location - e.g a storage area, or an automated distribution system... 
An __Inventory Reporter__ can inform the present item count (snapshot mode); in some applications, it may inform about differential updates. 
* The __Inventory Manager__ receives inventory information (for the purpose of forwarding or taking further action e.g. deciding on reordering)

**These actors are expected to be combined, depending of the system configurations and inventory management policies**. 
For example, an automated distribution system (like a *smart cart*) may keep track of the items it contain on, to decide about reordering; it may also send such information (acting as as an __Inventory Reporter__) to another system (__Inventory Manager__) so that 
the other system can decide whether / when to reorder.

<br/>


#### Consumption
Consumption reports the usage or depletion of stock :
* The __Item Consumer__ reports a consumption of an item (to an __Inventory Manager__).  
A consumption can correspond with an administration of a product (removing it from available inventory) or a disposal. 
In this sense, the consumption report is just a differential update of inventory and is therefore very similar to the previous interaction.
Since the consumption is a differential update of inventory, it can also be used for stock increases when necessary, e.g. returning products to inventory.

<img src="inventory_report.png" width="60%"/>
<br clear="all"/>

<img src="consumption.png" width="60%"/>
<br clear="all"/>

<br/>
