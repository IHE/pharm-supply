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
<i>This use case shows that supply involves not only the information flow
but also the materials flow, which can bring additional requirements,
such as the transformation of items between actors – for example, a
transport may result in unwanted alteration of the products, and the
result is that what is shipped is not what is delivered, which affects
inventory management.</i>
</div>

### Preconditions

A hospital has a stable stock of meningitis vaccines. After a surge of
meningitis cases during summer, the hospital stock is almost depleted,
and they decide to reorder medication (this is similar to the first use
case in this document).

### Resupply and Return

The pharmacist in the hospital requests the medication, which is
prepared and shipped from the vendor. The shipment is accompanied by an
electronic shipment notice, which informs the pharmacist about the
pending delivery and quantities.

After the medication is delivered to the hospital, the pharmacist
notices that some of the items appear to be damaged in transport. 8
units are in proper condition and are added to the inventory of the
hospital. 2 units however are not in proper condition, and the
pharmacist cannot use them.

The pharmacist decides to return the items, and during a phone call, the
vendor agrees with that return. The vendor prepares an RMA
(authorization to return materials).

The hospital pharmacist prepares the items for sending back to the
vendor, in a process that is similar to the initial shipment:
identifying which items are to be sent, preparing a shipment notice, and
sending the items.

In some cases, the invoice can be paid in full and then the credit
invoice is issued. In other cases, the invoice can be immediately
revised… The complexity of this matter is not in the scope of this work,
but the information required for billing is provided by the mechanisms
discussed in this document.

### Sequence Diagram


  <figure>
    {% include usecase-6-diagram.svg %}
    <!-- <figcaption>Use Case 6</figcaption> -->
  </figure>


<!-- <div style="text-align:center">
<img src="image_UC6_SequenceDiagram.png" style="width:4.57156in;height:8.1833in"/>
</div> -->

### Requirements

This use case introduces the following requirements:

#### Add Items to Inventory

There is a need for a mechanism to add units to inventory, i.e.,
register new units in the inventory. This may be an interoperability
requirement for later, but for now it is considered to be a
functionality that is directly in the inventory management system.

#### Return Authorization

There is a need to inform of the authorization to send items(which are
expected to be uniquely identified). This acts in a similar way to an
inventory order (with reversed roles in this case), where one of the
party’s requests allows the other party to send some items. The
participant parties themselves, as presented before, should be uniquely
identified as well.

#### Return of Items

The return of items is similar to the delivery of items: One party
informs the other about the sending of items. This exchange is also
supported by standards for content and for item identification.

