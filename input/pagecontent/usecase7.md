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
<i>This use case describes how a physical item (product package) can be
checked at dispense time, according to the Falsified Medicines
Directive. The dispenser retrieves the item, and when scanning it, the
system performs a lookup of the item’s serial and lot numbers, returning
information whether the product is considered OK or not.</i>
</div>

### Preconditions

The pharmacy system adopts FMD compatibility and IHE transactions.

The pharmacist has still some items from his trusted supplier, and has
received a new shipment from a new supplier.

The products delivered by the trusted supplier have been registered in
the FMD Hub, as described in the IHE educational material for FMD:
[<u>https://www.ihe.net/wp-content/uploads/uploadedFiles/Documents/Pharmacy/IHE-Pharmacy-FMD-
Guide_Rev1.0_2017-02-08.pdf</u>](https://www.ihe.net/wp-content/uploads/uploadedFiles/Documents/Pharmacy/IHE-Pharmacy-FMD-
Guide_Rev1.0_2017-02-08.pdf)

The products delivered by the new supplier are not registered.

Both products have a label with a barcode that contains the GTIN, the
lot number, serial number, and expiry date. The GTIN is the same since
it is the same product, but the lot numbers, and expiry dates are
different between the two products. The serial number is of course
unique for each item.

### Retrieval and Online Checking

The pharmacist is dispensing medication for a patient. This can be in
hospital and community pharmacy[^1].

The pharmacist first gets a product from the new supplier. When
retrieving the product, the barcode is scanned. The system immediately
triggers a product info lookup as mandated by the FMD. Since this
product has not been registered in the FMD hub, that system responds
that the item is not OK.

The pharmacist quarantines or discards the suspect item, and retrieves
another item from his previous supplier. The second barcode is submitted
and the response is that the item is OK.

The dispenser dispenses the second item and registers it as assigned to
that patient. For inventory purposes, two items have been consumed. But
only one dispensed.

### Sequence Diagram


<figure>
  {% include usecase-7-diagram.svg %}
  <figcaption>Example with styles and other features</figcaption>
</figure>

### Requirements

This use case introduces the following requirements:

#### Inventory Item Lookup Request

There is a need to look up a specific product from another provider.
This is a request which identifies the complete product information –
this includes not only the product type, but also the physical product
attributes – lot, expiry, serial, etc.

#### Physical Item Lookup Response

The product lookup should provide the adequate information. In this use
case, the information expected can be a simple “OK”/”Not OK”. In some
cases, a more complex payload could be expected, such as a traceability
report. A wide variety of such cases can be expected, so it is important
not to limit the possibilities.
<br>
<p>
</p>


[^1]: This can happen either in hospital pharmacy central distribution, when the pharmacist prepares the dispenses for distribution to the wards, OR in a community pharmacy).
