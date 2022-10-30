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
<i>This simple use case introduces the articulation between the clinical
and operational aspects. It includes an order entry with mandatory
validation, dispense at the ward and administration.</i>
<br>
<i>This use case introduces inventory management and resupply as needed
for a basic scenario.</i>
</div>

### Preconditions

A patient, John Smith, is admitted to the hospital by his Physician with
acute abdominal pain.

The admissions department has registered John in the hospital
information system and an encounter has been created for John Smith.

This encounter specific information has been broadcast via interface to
other hospital systems, including the Pharmacy Information System,
Computerized Physician Order Entry System, Pharmacy Dispensing System,
and Electronic Medication Administration System.

In the ward G1 (where John Smith will be admitted), there is a stock of
commonly used medication. Among those is **hyoscine butylbromide 10
mg**, with trade name BUSCOPAN IBS RELIEF.

The identifier for the "virtual" pharmaceutical product **hyoscine
butylbromide 10 mg** is a code: 603985.

The product is available in <u>ward G1</u> and in the central pharmacy.
The product is labeled as shown below:

<div style="text-align:center">
<img src="image_UC1_MarkingBuscopan.png" style="width:3.45255in;height:1.95313in" />
</div>
<br>

(Each box of BUSCOPAN IBS RELIEF is marked with a vendor-issued barcode
corresponding to the global trade item number: 5012917021912.)

While the product available is a commercial product, inside the hospital
the users do not refer to products by their commercial names. Both the
physician and the pharmacists refer to this product as "**hyoscine
butylbromide 10 mg** " (pharmaceutical product).

Due to a previous bulk purchase, all of the initially available units of
BUSCOPAN at the hospital have the same lot number: ABC0001. This lot has
an expiry date of 12-2016.The available inventory for **hyoscine
butylbromide10 mg** (BUSCOPAN IBS RELIEF) is as follows[^1]:


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
    border-bottom-color: #cccccc;"><strong>28</strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>28</strong></td>
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
    border-bottom-color: #cccccc;"><strong>5</strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>5</strong></td>
      <td>5</td>
      <td>10</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

In this case, the Unit of Distribution is the box containing 20 tablets.
The unit of use is the tablet. For purpose of reordering, this use case
assumes that the pharmacy only considers full boxes.

For this use case alone when a nurse consumes one tablet, the nursing or
pharmacy system can determine that there are now one box that is not
full but lacking one tablet, and while the pharmacy knows the exact
amount of tablets left, it considers that the open box is "in use" and
no longer counts for inventory.

In some cases, the number of uses or single doses that can be obtained
from each distribution unit is not known – for example when products are
fractioned (injectables, or ointments). This would mean that the
pharmacy may not have a clear insight into the inventory information for
these products.

Due to the health system policy, in this use case, there is no need to
check for eligibility – all patients are entitled to any medicinal
product. Billing is calculated elsewhere and is not in scope.

### Ordering

Upon checking on the patient, and given the diagnosis of Irritable Bowel
Syndrome, and seeing no contraindications, the physician uses a
Computerized Physician Order Entry system to enter an order for
**hyoscine butylbromide 10 mg** with a defined dosage for patient John
Smith.

This order is then presented to the Pharmacist responsible for the
patient's floor. The Pharmacist reviews the orders for appropriate
dosing and any contraindications or allergies. Once the review is
complete, the Pharmacist approves the order.

The Medication Dispensing System and Medication Administration System
are updated with the validated order, as the order is now planned for
administration.

### Dispensing and Administration

Because the medicinal product has already been distributed to the ward
before the patient needing it, there is no need for an explicit dispense
in the pharmacy. The medicinal product is to be given to the patient by
the nurse, from the ward stock. This means that a specific tablet will
be assigned to a patient at the ward (either at administration time, or
e.g., in a preparation in the morning shift). <u>This is the act of
dispense: when a medicinal product is assigned to a patient</u>. This
notion is fundamental throughout this document. In other use cases, the
dispense is an explicit action in the pharmacy, but <u>in this case,</u>
<u>the dispense is implicitly done by the nurse when picking the
medicinal product for the patient</u>.

The nurse consults the Medication Administration System which contains
the patients' Medication Administration Records (MARs) with the planned
medications. At the scheduled time, the system may notify the nurse, who
then identifies the patient (by manual entry in the system, or with a
barcode) (e.g., by scanning the patient's wrist barcode[^2]), and sees
that the medication "**hyoscine butylbromide 10 mg** " is required.
Since the ward contains some products in their commercial package, the
system displays to the nurse the name that can be recognized in the
package: BUSCOPAN IBS RELIEF. To administer the medicinal product to the
patient, the nurse takes one pack of BUSCOPAN IBS RELIEF from the ward
shelf, and scans its barcode. From the scanned barcode – which contains
the product’s trade item code (5012917021912), but also possibly other
data such as expiry date and lot number, the medicinal product
administration system confirms that this is the <u>right medicinal
product</u> for the <u>right patient.</u> From the barcode of the
medicinal product it is also possible to consult a product data base
which would indicate that this is a tablet for oral administration, so
the <u>right dose and strength</u>, as well as the <u>right route</u>
are also verified, and the system time indicates that it is at the
<u>right time</u>). Consulting such database is also the subject of
standards like GS1’s GDSN in the supply world, and this example shows
its utility for clinical use.

The nursing system informs the Pharmacy Dispensing System and the
Computerized Physician Order Entry System that this medicinal product
has been consumed and administered in that quantity.

The ward stock level after picking the box is as follows:

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
    border-bottom-color: #cccccc;"><strong>4</strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:right;"><strong>Total:</strong></td>
      <td><strong>4</strong></td>
      <td>5</td>
      <td>10</td>
    </tr>
    <tr>
      <td colspan="7"><strong>. . .</strong></td>
    </tr>
  </tbody>
</table>

> **Note:** In this case, traceability is limited to the level of the
> medicinal product, not to its batch number and expiry date. This
> introduces a traceability constraint which may imply some risk.

If finer traceability is desired, the approach must include
lot-traceability or unique item traceability by using AIDC technologies
(e.g., barcode) at dispense.

### Sequence Diagram


  <figure>
    {% include usecase-1-diagram.svg %}

  </figure>

<br>
<p>
</p>


[^1]: This table is a simplified view that shows the relevant data for this scope; it is not intended to be used as guidance  
[^2]: The use of barcodes for identifying patients is also enabled by standardized identifiers such as GS1’s GSRN.
