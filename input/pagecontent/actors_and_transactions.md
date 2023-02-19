This section defines the actors and transactions in this implementation guide.

The figure below shows the actors directly involved in the MHD Profile and the relevant transactions between them.

  <figure>
    {% include actors-transactions.svg %}
  </figure>

<br/>
<br/>

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<caption>
<b>
Table : Supply - Actors and Transactions
</b>
</caption>
<thead>
<tr style='background: gray;'>
<th>Actors</th>
<th>Transactions</th>
<th>Optionality</th>
</tr>
</thead>
<tbody>
    <tr>
        <td rowspan="2"><a href="#supply-requester">Supply Requester</a></td>
        <td><a href='PHARM-S1.html'>Supply Request [PHARM-S1]</a></td>
        <td align='center'>O</td>
    </tr>
    <tr>
        <td><a href='PHARM-S2.html'>Supply Request [PHARM-S2]</a></td>
        <td align='center'>O</td>
    </tr>
    <tr>
        <td rowspan="2"><a href="#supply-request-receiver">Supply Request Receiver</a></td>
        <td><a href='PHARM-S1.html'>Supply Request [PHARM-S1]</a></td>
        <td align='center'>O</td>
    </tr>
    <tr>
        <td><a href='PHARM-S2.html'>Supply Request [PHARM-S2]</a></td>
        <td align='center'>O</td>
    </tr>
    <tr>
        <td rowspan="2"><a href="#supplier">Supplier</a></td>
        <td><a href='PHARM-S3.html'>Supply Notice [PHARM-S3]</a></td>
        <td align='center'>O</td>
    </tr>
    <tr>
        <td><a href='PHARM-S4.html'>Receipt Notice [PHARM-S4]</a></td>
        <td align='center'>O</td>
    </tr>
    <tr>
        <td rowspan="2"><a href="#receiver">Supply Request Receiver</a></td>
        <td><a href='PHARM-S3'>Supply Notice [PHARM-S3]</a></td>
        <td align='center'>O</td>
    </tr>
    <tr>
        <td><a href='PHARM-S4.html'>Receipt Notice [PHARM-S4]</a></td>
        <td align='center'>O</td>
    </tr>
</tbody>
</table>


____  

<br/>             

### Ordering
For the ordering aspects of supply request, two actors are considered: 

<img src="actors_ordering.png" width="60%"/>
<br clear="all"/>


#### <a name="supply-requester"></a>**Supply Requester** 
Issues requests for supply. The request can be triggered by any of several events - periodic reordering, minimum reached, etc.
* Sends supply request - transaction [PHARM-S1](PHARM-S1.html).
* Receives updates on supply request status - transaction [PHARM-S2](PHARM-S2.html). 


#### <a name="supply-request-filler"></a>**Supply Request filler**
Receives and handles the supply request. The handling can be to respond (e.g. with approval) and/or to forward the request (e.g. to the actual supplier).
* Sends updates on supply request status - transaction [PHARM-S2](PHARM-S2.html). 
* Receives supply request - transaction [PHARM-S1](PHARM-S1.html).


<br/>

**These actors can be chained - in a specific implementation, a system can be both a Requester and a Request Filler.** For example a local pharmacy requesting products from a local pharmacy who then contacts the local supplier who then contacts the national distributor. In this case the central pharmacy receives requests from wards or remote pharmacies, and sends approved/updated requests to the supplier or distributor (thus acting as a Request Filler and Requester in the same process).
This chaining is the reason why the transactions are optional - for example an actor that is only forwarding the request after approval may implement only the Supply Request transaction, but not support receiving the status.


### Delivery


The delivery considers two actors: 

<img src="actors_delivery.png" width="60%"/>
<br clear="all"/>

#### <a name="supplier"></a>**Supplier**
The supplier sends or forwards the items to a receiver and updates the information about such sending:
* Sends shipment notices - transaction [PHARM-S3](PHARM-S3.html). 
* Receives delivery notices - transaction [PHARM-S4](PHARM-S4.html). 


#### <a name="receiver"></a>**Receiver**
This actor represents the intended or actual receiver of the products.
* Sends delivery notices - transaction [PHARM-S4](PHARM-S4.html). 
* Receives shipment notices - transaction [PHARM-S3](PHARM-S3.html). 

<br/>

**These actors can also be chained in any implementation**. For example, a warehouse (as a __Supplier__) sends items to a retailer (__Receiver__) who then send them (now as a __Supplier__) to the Central Pharmacy (which takes the role of __Receiver__).

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

<br/><br/>