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
<i>This use case describes a situation where the pharmacy has, besides
normal inventory items, an agreement with a vendor, who leaves some
items to be exhibited in the pharmacy. These items are in consignment
and not ordered by the pharmacy. They are under the responsibility of
the vendor until sold.</i>
</div>

### Preconditions

<u>The Pharmacy stock has recently been recounted and is considered
accurate. The following items are available in the pharmacy:</u>

<table class="table-bordered table-usecase">
  <thead>
    <tr>
      <th colspan="7">Pharmacy Stock</th>
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
      <td rowspan="3"><strong>05725361962471</strong></td>
      <td rowspan="3">XXXXXXXXXX</td>
      <td>LLABC01</td>
      <td>12-2017</td>
      <td>10</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="cell-shaded"><strong>LLABC03</strong></td>
      <td class="cell-shaded"><strong>01-2018</strong></td>
      <td class="cell-shaded" style="border-bottom-width: 3px;
    border-bottom-color: #cccccc;"><strong>8</strong></td>
      <td class="cell-shaded">&nbsp;</td>
      <td class="cell-shaded">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>18</strong></td>
      <td>5</td>
      <td>10</td>
    </tr>
    <tr>
      <td rowspan="3"><strong>03582938641053</strong></td>
      <td rowspan="3">XXXXXXXXXX</td>
      <td>383035</td>
      <td>07-2018</td>
      <td>3</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><strong>383037</strong></td>
      <td><strong>03-2019</strong></td>
      <td style="border-bottom-width: 3px;
    border-bottom-color: #cccccc;"><strong>7</strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>10</strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

The second item is in consignment, and as such. the inventory is managed
by the vendor.

### Sale of Items

A patient presents a prescription which contains two items. These items
are both available in the pharmacy (one is in normal stock, another is
in consignment).

After the dispense, the inventory is depleted by one unit of each. For
the item that is in normal stock, this brings the product to a level
below the order level. The pharmacy system proposes to the pharmacist to
order more of these items to restore the inventory levels, and the
pharmacist approves. The order is sent to the vendor, which will supply
the item in the desired quantity.

As for the second item, the medical device, the pharmacy system does not
track the inventory, but rather sends each consumption to the vendor, so
that the vendor can manage the stock of these items. In this case, the
consumption report is sent to the vendor, which triggers the billing of
that item to the pharmacy. In addition, the vendor realizes that it is
better to replenish the item at that pharmacy, so it prepares a shipment
that will be delivered during a next delivery round to the pharmacy.

### Sequence Diagram

  <figure>
    {% include usecase-4-diagram.svg %}
    <!-- <figcaption>Use Case 4</figcaption> -->
  </figure>


<!-- <div style="text-align:center">
<img src="image_UC4_SequenceDiagram.png" style="width:6.26875in;height:7.89841in"/>
</div> -->

### Requirements

This use case introduces the following requirements:

##### **Consumption Report**

There is a need to indicate the consumption of an item, without that
being an order for refill. It is simply an indication that one item has
been consumed.

The consumption report must be able to convey information on:

- the item that was used - to the traceability level that is desired (i.e., including lot, serial and expiry info if adequate),

- the consumer (in this case, the pharmacist, but it can also be a nurse, or a patient…),

- the consumption act (date, time, place),

- eventually the patient,

  - sometimes there are consumptions that are not associated with a patient, and sometimes the patient information is not to be conveyed for privacy or other reasons

- (any additional data deemed necessary for the concrete use)


