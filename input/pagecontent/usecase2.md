<style>
  .table-usecase {
    width: 100%;
  }

  .table-usecase > thead > tr > th,
  .table-usecase > tbody > tr > th,
  .table-usecase > tfoot > tr > th,
  .table-usecase > thead > tr > td,
  .table-usecase > tbody > tr > td,
  .table-usecase > tfoot > tr > td {
    text-align: center;
  }

  .table-usecase .cell-shaded {
    background-color: #e6e6ff;
  }
  
  .table-usecase .cell-fat-bottom {
    border-bottom-width: 3px;
    border-bottom-color: #cccccc;
  }
</style>

<div style="  border: 1px solid; padding: 5px; margin: 5px;">
<i>This simple use case articulates with the previous to describe the
resupply of medication from the vendor to the ward.</i>
<br>
<i>It describes the situation of supplier-managed inventory: the
consumption of items is registered in a system that is not responsible
for maintaining its own stock: it reports to the supplier (Pharmacy)
each consumption, and the supplier uses this information to keep track
of the inventory, and decide to order any resupplies to the ward.</i>
</div>

### Preconditions

In the beginning of the year, the hospital made a contract with a
supplier for BUSCOPAN IBS RELIEF, where the conditions (e.g., prices and quantities) are defined for the whole year.

As described in Section 7.1., for inventory of the ward, only the full
boxes are taken into account. In this use case, a box that contains 19
tablets instead of 20 is considered "in use" and just for this use case,
it is already considered "consumed" even if there are still 19 tablets.
This is the case when a box of tablets is "reserved" for a patient whom
this product had been prescribed.

### Internal Resupply - Request and Transfer

When the nurse confirms the usage of the medication and the Nursing
system issues a Dispense report, the Pharmacy becomes aware that one
unit has been consumed and that the stock of BUSCOPAN IBS RELIEF at the
ward is reduced: While before there were 5 full boxes, there are now 4
full boxes plus one box with 19 tablets left.

The WMS at the pharmacy detects that the stock of BUSCOPAN IBS RELIEF at
the ward is now below the reorder level[^1], and proposes to the
responsible pharmacist to refill the ward stock from the pharmacy stock,
with the default order quantity (10 boxes) (note that there are cases
where the ward pharmacy disposes of a stock management system, which
sends a request to the central pharmacy when stock level requires).

After approval of the pharmacist, the 10 boxes are transported to the
ward.

When the items arrive at the ward, the responsible for the reception
scans the barcodes of the medication boxes. By scanning the 10 barcodes,
it is confirmed to the WMS that the ward stock is now accrued by 10
boxes of BUSCOPAN IBS RELIEF; this accrual includes the lot and expiry
information about the products that have been received.

The WMS system at the pharmacy considers that transfer of inventory, by
reassigning those 10 units from the central pharmacy to ward G1. As a
consequence, the inventory levels are as follows:

<table class="table-bordered table-usecase">
  <thead>
    <tr>
      <th colspan="7">Pharmacy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Item Code</td>
      <td>Item name</td>
      <td>Lot</td>
      <td>Expiry Date</td>
      <td>Available qty</td>
      <td>Reorder level</td>
      <td>Default order qty</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
    <tr>
      <td rowspan="2"><strong>5012917021912</strong></td>
      <td rowspan="2">BUSCOPAN IBS RELIEF <br> bx 20 tablets</td>
      <td>ABC0001</td>
      <td>12-2016</td>
      <td style="border-bottom-width: 3px;
    border-bottom-color: #cccccc;"><strong>18</strong> (was:28)</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>14</strong></td>
      <td>20</td>
      <td>50</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

<table class="table-bordered table-usecase">
  <thead>
    <tr>
      <th colspan="7">Ward G1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Item Code</td>
      <td>Item name</td>
      <td>Lot</td>
      <td>Expiry Date</td>
      <td>Available qty</td>
      <td>Reorder level</td>
      <td>Default order qty</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
    <tr>
      <td rowspan="2"><strong>5012917021912</strong></td>
      <td rowspan="2">BUSCOPAN IBS RELIEF <br> bx 20 tablets</td>
      <td>ABC0001</td>
      <td>12-2016</td>
      <td style="border-bottom-width: 3px;
    border-bottom-color: #cccccc;"><strong>14</strong> (was:4)</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>14</strong></td>
      <td>5</td>
      <td>10</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

### Resupply Request

With this transfer, the stock at the pharmacy is now below the reorder
level. Due to this, the WMS proposes to the pharmacist a reorder from
the supplier, with the default order quantities (50 boxes). The
pharmacist approves the order.

This resupply request is sent to the hospital’s purchasing department
through the ERP system. The ERP system also determines the preferred
vendor (wholesaler). The ERP user issues an order for 50 boxes of item
BUSCOPAN IBS RELIEF, code 5012917021912 to refill the hospital stock.
This order has an internal ID MD00015 in the ERP. Given the existence of
a contract, the resupply order does not need any specific approval
workflows: Once it is validated in the ERP, the order is sent to the
vendor. Only a notification is also sent for the financial management
system, to prepare the billing processor to receive an invoice.

### Supplier Order Processing

The supplier receives the order, checks product availability and informs
the hospital that the order has been accepted. When shipping the 50
items to the hospital pharmacy, an electronic dispatch advice is issued,
which includes all traceability information (item identification,
lot/batch number, expiry date) as well the identification of the
shipment. The information about the shipment is as follows:

<table class="table-bordered table-striped">
  <thead>
    <tr>
      <th colspan="3">Shipment ID: 773500538500000018</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan ="2">Item</td>
    </tr>
    <tr>
      <td style="text-align:right;">Customer Order Number:</td>
      <td>MD00015</td>
    </tr>
    <tr>
      <td style="text-align:right;">GTIN:</td>
      <td>5012917021912</td>
    </tr>
    <tr>
      <td style="text-align:right;">National Code:</td>
      <td>xyz123</td>
    </tr>
    <tr>
      <td style="text-align:right;">Name:</td>
      <td>BUSCOPAN IBS RELIEF</td>
    </tr>
    <tr>
      <td style="text-align:right;">Lot number:</td>
      <td>XYZ0009</td>
    </tr>
    <tr>
      <td style="text-align:right;">Expiry date:</td>
      <td>03-2017</td>
    </tr>
    <tr>
      <td style="text-align:right;">Quantity:</td>
      <td>50</td>
    </tr>
  </tbody>
</table>

### Item Reception

Upon the arrival of the items to the hospital pharmacy, the
identification of the shipment is scanned and linked to the electronic
dispatch advice. Since the shipment notice has been received, the
shipment ID can be matched with the received items and with the order
for BUSCOPAN IBS RELIEF.

Upon scanning the shipment ID, the WMS system looks up the content of
the shipment notice and since there is a match, the ERP gets updated
with the received items, including their traceability data (Lot number
and expiry date).

> **Note**: In some cases, it may be decided to scan each trade item
> received. This can be advised in some cases. Some examples:

- When some items are suspected to be damaged, then only the ones that
 are in proper condition are acknowledged as received. (see Use Case
 6 Cold-stored medication, resupply and return for return of products
 to supplier)

- When the shipment identifier cannot be read or matched.

- When any directive from each partner advises the scan - e.g., for
 expensive or controlled items

In short, the scanning of each item may be advised when, for any reason,
it is considered that the received items may not match the inventory
description

As the received items match the order issued by the pharmacy, the
pharmacy inventory is updated from the shipment notice - the items
described in the shipment notice are added to the stock. Use Case 6
Cold-stored medication, resupply and return describes a case of arrival
of items that do not precisely match one order.

The items are then placed on the shelf in the Pharmacy, and the
Warehouse Management System gets updated for the new inventory items in
the reception area.

The detailed inventory status at the pharmacy is finally as follows:

<table class="table-bordered table-usecase">
  <thead>
    <tr>
      <th colspan="7">Pharmacy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Item Code</td>
      <td>Item name</td>
      <td>Lot</td>
      <td>Expiry Date</td>
      <td>Available qty</td>
      <td>Reorder level</td>
      <td>Default order qty</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
    <tr>
      <td rowspan="3"><strong>5012917021912</strong></td>
      <td rowspan="3">BUSCOPAN IBS RELIEF <br> bx 20 tablets</td>
      <td>ABC0001</td>
      <td>12-2016</td>
      <td>18</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="cell-shaded"><strong>XYZ0009</strong></td>
      <td class="cell-shaded"><strong>03-2017</strong></td>
      <td class="cell-shaded" style="border-bottom-width: 3px;
    border-bottom-color: #cccccc;"><strong>50</strong></td>
      <td class="cell-shaded">&nbsp;</td>
      <td class="cell-shaded">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>68</strong></td>
      <td>20</td>
      <td>50</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

### Sequence Diagram

  <figure>
    {% include usecase-2-diagram1.svg %}
    <!-- <figcaption>Use Case 1</figcaption> -->
  </figure>

  <figure>
    {% include usecase-2-diagram2.svg %}
    <!-- <figcaption>Use Case 1</figcaption> -->
  </figure>


<!-- <div style="text-align:center">
<img src="image_UC2_SequenceDiagram1.png" style="width:5.89233in;height:8.11774in"/>
</div>

<div style="text-align:center">
<img src="image_UC2_SequenceDiagram2.png" style="width:6.26875in;height:5.4742in"/>
</div> -->
<br>
<p>
</p>


[^1]: The reorder level may be calculated automatically by the WMS as a function of several factors including the expected use. For example, the minimum level can be calculated as the number of tablets needed for 2 days and the maximum for 7 days of average usage in that specific ward.
