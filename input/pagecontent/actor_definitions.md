
### Ordering
For the ordering aspects of supply request, two actors are considered: 

<img src="actors_ordering.png" width="60%"/>
<br clear="all"/>


#### <a name="supply-requester"></a>**Supply Requester** 
Submits a request for supply. The request can be triggered by any of several events - periodic reordering, minimum reached, etc.

#### <a name="supply-request-filler"></a>**Supply Request filler**
Receives and handles the supply request. The handling can be to respond (e.g. with approval) and/or to forward the request (e.g. to the actual supplier).


<br/>

**These actors are expected to be chained - in a specific implementation, a system can be both a Requester and a Request Filler.** For example a local pharmacy requesting products from a local pharmacy who then contacts the local supplier who then contacts the national distributor. In this case the central pharmacy receives requests from wards or remote pharmacies, and sends approved/updated requests to the supplier or distributor (thus acting as a Request Filler and Requester in the same process).


### Delivery


The delivery considers two actors: 

<img src="actors_delivery.png" width="60%"/>
<br clear="all"/>

#### <a name="supplier"></a>**Supplier**
Sends or forwards the items to a receiver and updates the information about such sending

#### <a name="receiver"></a>**Receiver**
the actor that represents the intended or actual receiver of the products



<br/>

**These actors are also expected to be chained in any implementation**. For example, a warehouse (as a __Supplier__) sends items to a retailer (__Receiver__) who then send them (now as a __Supplier__) to the Central Pharmacy (which takes the role of __Receiver__).


<br/>


### Inventory
The inventory management module supports the tracking and counting of inventory items and status (i.e. inventory counts). It is consists of two essential mechanisms: Inventory status updates, and inventory consumption.

<img src="actors_inventory.png" width="60%"/>
<br clear="all"/>

Inventory status updates concerns the monitoring and reporting of inventory locations - i.e. the availability (or not) of inventory items. The actors are:

#### <a name="inventory-reporter"></a>__Inventory reporter__ 
Provides information about the inventory in a location <br/>This actor is typically implemented by systems associated with one or several inventory location - e.g a storage area, or an automated distribution system...  <br/> An __Inventory reporter__ can inform the present item count (snapshot mode, used for reporting stock counts), or may inform about differential updates (differential mode, used for reporting stock increase or decrease). 
#### <a name="inventory-manager"></a>__Inventory Manager__ 
Receives inventory information (for the purpose of forwarding or taking further action e.g. deciding on reordering)



**These actors are expected to be combined, depending of the system configurations and inventory management policies**. 
For example, an automated distribution system (like a *smart cart*) may keep track of the items it contain on, to decide about reordering; it may also send such information (acting as as an __Inventory Reporter__) to another system (__Inventory Manager__) so that the other system can decide whether / when to reorder.

<br/>

Consumption is a specialized case of inventory reporting, to inform of usage of inventory:


#### <a name="inventory-reporter"></a>__Inventory Reporter__ <br/>(__Item Consumer__) 
reports a consumption of an item (to an __Inventory Manager__).  




Most times a consumption is not explicitly reported, but corresponds with a dispense or administration of a product (removing it from available inventory) or a disposal. 
In this sense, the consumption report is just a differential update of inventory.

Since the consumption is a differential update of inventory, the same actor (inventory status reporter) it can also report stock increases when necessary, e.g. returning products to inventory.
