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
<i>This use case describes another type of product lookup: Not checking
the status of a specific physical item, but looking up the
characteristics of that kind of product in the “catalog”: When preparing
a device.</i>
</div>

###  Preconditions

In the Operating room, a patient is receiving a lung catheter. The
procedure has been scheduled 2 weeks in advance, and when preparing the
patient for surgery, the team notes that patient intolerance to latex is
not documented, so they decide to use latex-free materials.

In the Operating Theater stock, there are catheters in consignment. Some
contain latex and others contain Liquid Silicone Rubber. All these
devices are labeled with a UDI label and barcode, and are registered in
the central registry for devices (in the US, the GUDID).

###  Scanning and Looking Up Products

#### Scanning UDI Barcode

To prepare for the surgery, the nurse retrieves the items from the local
inventory. When scanning the UDI Barcode, the OR system parses the
barcode, obtaining the lot number, serial number and expiry date. The
expiry date is still in the future and the product is considered valid
for implant.

#### Looking Up Product in the Catalog

But the OR system can also lookup the product in the local catalog, to
obtain more information like the price (for charges) or any other
information. The OR system submits the product GTIN and obtains the
catalog information, which includes *“Device labeled as containing
natural rubber latex or dry natural rubber (21 CFR 801.437)”*.

The OR system has been informed that the patient may be allergic to
latex, and this immediately triggers an alert to the nurse. The nurse
retrieves another device.

#### Looking Up Product Type in the EHR Order

After the product characteristics are obtained, the product is matched
against what was ordered or the patient.

This is done by submitting the product information (Product ID or
attributes) against the EHR which contains the order, whether for a
specific product ID or containing specified characteristics. The EHR
responds with the result of the matching.

###  Sequence Diagram

  <figure>
    {% include usecase-8-diagram.svg %}
    <!-- <figcaption>Use Case 8</figcaption> -->
  </figure>


<!-- <div style="text-align:center">
<img src="image_UC8_SequenceDiagram.png" style="width:4.90557in;height:8.06589in"/>
</div> -->

###  Requirements

This use case introduces the following requirements:

#### Catalog Item Lookup Request

There is a need to look up one product type. This is in all aspects
similar to the physical product lookup, except that the physical product
attributes (lot, etc.) are not required. Since the physical product
lookup contains a superset of the information in the Catalog Item Lookup
request, it may be that this is not strictly a new requirement, but can
be covered by the Physical Item Lookup. This is supported by using
standards-based interactions with a product data repository, like GS1’s
GDSN.

#### Catalog Item Lookup Response

As a result of the Catalog Item Lookup request, the response is expected
to be a descriptive set of product characteristics. In this case, it is
a presence of latex or something else. It can also be a broad set of
characteristics, from which the receiver can select those appropriate.
These are “catalog” characteristics, so they are defined for the product
type.


