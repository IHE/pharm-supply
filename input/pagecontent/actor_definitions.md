
#### Ordering
For the supply request, two actors are considered: 
* **Supply Requester**: the actor that presents a request to another entity. The request can be triggered by one of several events - periodic reordering, minimum reached, etc.
* **Supply Request filler**: the actor that handles that request - whether to respond to it or to forward it.

**These actors are expected to be chained - in a specific implementation, a system can be both a Requester and a Request Filler.** For example a local pharmacy requesting products from a local pharmacy who then contacts the local supplier who then contacts the national distributor. In this case the central pharmacy receives requests from wards or remote pharmacies, and sends approved/updated requests to the supplier or distributor (thus acting as a Request Filler and Requester in the same process).

<img src="actors_ordering.png" width="60%"/>
<br clear="all"/>

#### Delivery

The delivery considers two actors: 
* **Supplier**, an actor that sends or forwards the items to a receiver and updates the information about such sending
* **Receiver** - the actor that represents the intended or actual receiver of the products

**These actors are also expected to be chained in any implementation**. For example, a warehouse (as a __Supplier__) sends items to a retailer (__Receiver__) who then send them (now as a __Supplier__) to the Central Pharmacy (which takes the role of __Receiver__).


<img src="actors_delivery.png" width="60%"/>
<br clear="all"/>

<br/>


### Inventory
The inventory management module supports the tracking and counting of inventory items and status (i.e. inventory counts). It is consists of two essential mechanisms: Inventory status updates, and inventory consumption.

#### Inventory status updates
Inventory status updates concerns the monitoring and reporting of inventory locations - i.e. the availability (or not) of inventory items. The actors are:
* The __Inventory reporter__ contains and information about the inventory in a location  
This actor is typically implemented by systems associated with one or several inventory location - e.g a storage area, or an automated distribution system... 
An __Inventory reporter__ can inform the present item count (snapshot mode); in some applications, it may inform about differential updates. 

* The __Inventory Manager__ receives inventory information (for the purpose of forwarding or taking further action e.g. deciding on reordering)

**These actors are expected to be combined, depending of the system configurations and inventory management policies**. 
For example, an automated distribution system (like a *smart cart*) may keep track of the items it contain on, to decide about reordering; it may also send such information (acting as as an __Inventory Reporter__) to another system (__Inventory Manager__) so that the other system can decide whether / when to reorder.

<br/>


#### Consumption
Consumption reports the usage or depletion of stock :
* The __Item Consumer__ reports a consumption of an item (to an __Inventory Manager__).  
A consumption can correspond with an administration of a product (removing it from available inventory) or a disposal. 
In this sense, the consumption report is just a differential update of inventory and is therefore very similar to the previous interaction.
Since the consumption is a differential update of inventory, it can also be used for stock increases when necessary, e.g. returning products to inventory.

<img src="actors_inventory.png" width="60%"/>
<br clear="all"/>
