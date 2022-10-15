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
<i>This use case shows the checking of inventory at a specific inventory
location - in this example, the satellite pharmacy must count the
inventory and report to the central pharmacy.</i>
<br>
<i>Since the inventory must be manually checked before reporting, the
initiator of this process is the satellite pharmacy.</i>
</div>

<div style="  border: 1px solid; padding: 5px; margin: 5px;">
<i>This use case deliberately relies on some assumptions to ensure a
broader functional scope, for example the Inventory application is a
remote/mobile app without any previous knowledge of the current
inventory.</i>
<br>
<i>This use case is limited to only one medication, although in practice,
several items are of course expected to be at a given location.</i>
</div>

### Preconditions

The responsible for the satellite pharmacy has a recurrent task to check
the current inventory level at his pharmacy. The satellite pharmacy has
2 inventory locations:

1.  The normal inventory in a dedicated room (labeled "Pharmacy Stock")

2.  The refrigerator where certain medication is kept in cold storage.

Besides this, the satellite pharmacy is also responsible for the ward
inventory, so there are 2 more locations:

3.  Ward G1

4.  Ward P1

Thanks to a procurement directive that mandates lot-traceability, the
product packages contain structured barcodes which contain not only the
item, but also lot number and expiry date:

<div style="text-align:center">
<img src="image_UC3_BarCode.png"
style="width:1.06265in;height:1.06265in" />
<br>
<br>

<b>(01)07612345678900</b>
<br>

<b>(17)141231(10)LX02374834</b>
</div>
<br>

<u>According to the central Pharmacy System</u>, which keeps track of
the inventory at the hospital, the inventory of the satellite pharmacy
is as follows:

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
      <td rowspan="3"><strong>07612345678900</strong></td>
      <td rowspan="3">XXXXXXXXXX</td>
      <td>LL1233223</td>
      <td>12-2016</td>
      <td>5</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="cell-shaded"><strong>LX02374834</strong></td>
      <td class="cell-shaded"><strong>03-2017</strong></td>
      <td class="cell-shaded" style="border-bottom-width: 3px;
    border-bottom-color: #cccccc;"><strong>8</strong></td>
      <td class="cell-shaded">&nbsp;</td>
      <td class="cell-shaded">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>13</strong></td>
      <td>5</td>
      <td>10</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

### Scan Location Inventory

At the end of the year 2014, the pharmacist goes through the inventory
locations, and counts the items in stock. The procedure is the same for
all locations, and is as below for Ward G1.

The pharmacist starts by identifying the location that is expected to be
scanned. This can be done by scanning the barcode for the location.

Since this barcode includes semantics, the inventory system
automatically interprets this scanning as a location identification. The
remote application requests from the central Pharmacy information about
the expected inventory for that location. This will allow to display any
discrepancies in real time.

When this information is received, the system notifies the user, who
then proceeds to scan the barcode of each item in the same location. The
scanning system contains the logic to parse the content of the barcode,
obtaining the following information about the scanned products:

- 4 boxes of item 07612345678900. This box has lot LL1233223 and an expiry date 12-2016.

- 8 boxes of item 07612345678900. This box has lot LX02374834 and an expiry date 03-2017.

- 1 box of item 07612345678900. This box has lot LA00012224 and an expiry date 02-2015.

(The last item is an item that is about to expire and was not used
earlier.)

After scanning all the items, the remote application displays a summary
of the scan results, including the discrepancies - 4 boxes of lot
LL1233223, instead of 5, and 1 unexpected box of lot LA00012224.

The pharmacist inspects the package and confirms that the item is indeed
of that lot, about to expire. The remote system submits the report to
the Pharmacy system, informing of the new inventory status. The Pharmacy
system updates this information in its database.

<u>At the end, the Pharmacy System contains the information that</u> the
inventory of the satellite pharmacy is as follows:

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
      <td rowspan="4"><strong>07612345678900</strong></td>
      <td rowspan="4">XXXXXXXXXX</td>
      <td>LL1233223</td>
      <td>12-2016</td>
      <td>4</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="cell-shaded"><strong>LX02374834</strong></td>
      <td class="cell-shaded"><strong>03-2017</strong></td>
      <td class="cell-shaded" style="border-bottom-width: 3px;
    border-bottom-color: #cccccc;"><strong>8</strong></td>
      <td class="cell-shaded">&nbsp;</td>
      <td class="cell-shaded">&nbsp;</td>
    </tr>
    <tr>
      <td>LA00012224</td>
      <td>02-2015</td>
      <td>1</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>13</strong></td>
      <td>5</td>
      <td>10</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

This information can then be used for any of the purposes in this
document, e.g., resupply, recall, etc.

### Sequence Diagram


  <figure>
    {% include usecase-3-diagram1.svg %}
    <!-- <figcaption>Use Case 1</figcaption> -->
  </figure>

  <figure>
    {% include usecase-3-diagram2.svg %}
    <!-- <figcaption>Use Case 1</figcaption> -->
  </figure>


<!-- <div style="text-align:center">
<img src="image_UC3_SequenceDiagram1.png" style="width:6.26875in;height:7.55037in"/>
</div>

<div style="text-align:center">
<img src="image_UC3_SequenceDiagram2.png" style="width:6.26875in;height:6.1946in"/>
</div> -->

