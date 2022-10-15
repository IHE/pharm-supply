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
<i>This use case describes a situation where an institution must provide
medication to the patients. This medication is provided by an agreement
between a hospital and the institution. The order is made in the
hospital and the treatment is made in the institution, outside of the
hospital.</i>
</div>

### Preconditions

In the hospital, the physician has issued a prescription for the
following items:

- Paracetamol 500 mg tablets 3 times per day as needed for 3 weeks.

- Amoxicillin 500 mg capsules for 2 weeks.

- Sertraline 100 mg tablet: ZOLOFT 100 mg tablets

This prescription is on “generic” level - doesn’t specify any trade products, only the substance, strength and dose form. These “generic” product descriptions (“virtual products”) have correspondence to trade products (“actual products”). This correspondence is usually available in a Medicinal Product Dictionary. In this case, we consider that the following products are available:

- Paracetamol - DEPON 500 mg tablets in boxes of 20, available at an automated dispenser in the remote institution

- Amoxicillin - AMOXIL caps 500 mg in boxes of 28 capsules, available in the central pharmacy

- Sertraline - ZOLOFT 100 mg tablets in boxes of 28 tablets, available in the remote institution

Amoxicillin is a prescription-only medicinal product and must be
dispensed per patient. For this medication, the Pharmacy dispenses the
complete treatment in order ensure treatment continuation, e.g., that
the medication will not be changed for an equivalent during the
treatment.

Sertraline requires can only be dispensed by a hospital pharmacy. The
pharmacy has a policy of not dispensing more than 7 tablets for a
patient, for two types of reasons:

- Clinical: to monitor the adherence and therapy for the patients

- Logistics: to minimize unused or misused inventory.

| Substance                   | **Brand**             | **Location**    | **Stock levels**         | **Dispense Max** |
|-----------------------------|-----------------------|-----------------|--------------------------|------------------|
| …                           | …                     | …               | …                        | …                |
| Paracetamol 500 mg tablets  | DEPON 500 mg tablets  | Satellite (Aut) | 60 boxes = 1200 tablets  | 7 days           |
| Amoxicillin 500 mg capsules | AMOXIL caps 500 mg    | C. Pharmacy     | 40 boxes = 1120 capsules |                  |
| Sertraline 100 mg           | ZOLOFT 100 mg tablets | Satellite (Man) | 24 boxes = 672 tablets   | 7 tablets        |
| …                           | …                     | …               | …                        | …                |
{: .table-bordered .table-striped}

### Dispensing

#### Part 1: Preparation, dispense and pickup (1st week of treatment)

When receiving the prescription, the pharmacist checks the prescription
and, knowing where the preferred inventory location of the items to be
dispensed are, steers a dispense request to the central pharmacy (for
paracetamol and amoxicillin) and informs the remote pharmacy about the
upcoming request for the sertraline.

The central pharmacy can immediately dispense the 21 paracetamol and 14
amoxicillin: A request is sent to the automated dispensing system for
the paracetamol, and the amoxicillin is dispensed manually at the
central pharmacy.

Since the rules for dispensing sertraline allow only dispensing for 7
days, the central pharmacy issues to the remote pharmacy a dispense
request for 7 units of sertraline.

The nurse picks up the medication from the central (possibly after a
transport) and from the remote pharmacies, for administering to the
patient. The transport itself can be identified and tracked with
standards for item and transport identification and data collection.

All of the dispense processes above can be followed by resupply or any
other processes, as described in previous use cases.

#### Part 2: Updates to dispense triggered by administration, consumption report

From the continued care institution, the Pharmacy receives information
about the administration and use of certain medication, to better adapt
their dispense processing.

In the first day of treatment, the nurse prepares the medication. By
accident, the nurse drops one of the tablets of amoxicillin and takes
another from the medications that were dispensed. The medication is
placed at the bed of the patient.

After 1 week, the nurse notes that the patient has not taken one of the
medications - sertraline. The patient opened the medication blister
given by the nurse, but only took it one day, and not the next 6 days.
The nurse must report that the medication is not taken but is to be
considered consumed. Since the paracetamol was supposed to be taken only
when needed, the nurse informs that only 6 tablets were consumed during
that week, instead of 21.

It is important to mention that throughout these processes, the
<u>locations</u> (wards, warehouse positions) <u>and participants</u>
(not only the patient, but also the nurse, physician, etc.) should be
uniquely identified. This is also supported by standards, to ensure good
traceability of processes.

From this, the physician is notified about the sertraline and informs
the pharmacy that the treatment should be restarted. The pharmacy
decides to dispense the medication that the patient did not take: The
pharmacy dispenses 7 more units for that week, but while this was
initially supposed to be the final dispense, it has now changed and 7
more units will be expected to be dispensed in the week after.

### Sequence Diagram

#### Part 1: Preparation, dispense and pickup (1st week of treatment)

  <figure>
    {% include usecase-5-diagram1.svg %}
    <figcaption>Use Case 1</figcaption>
  </figure>

<!-- <div style="text-align:center">
<img src="image_UC5_SequenceDiagram1.png" style="width:5.76895in;height:7.82642in"/>
</div> -->


#### Part 2: Updates to dispense


  <figure>
    {% include usecase-5-diagram2.svg %}
    <!-- <figcaption>Use Case 1</figcaption> -->
  </figure>

<!-- <div style="text-align:center">
<img src="image_UC5_SequenceDiagram2.png" style="width:6.26875in;height:7.89841in"/>
</div> -->




### Requirements

This use case underlines the need for a dispense request that is not a
prescription – it is a logistics / materials order, just to provide the
items that are needed for the execution of the clinical activities.

This use case introduces the following requirements:

#### Add Items to Inventory

There is a need for a mechanism to add units to inventory, i.e.,
register new units in the inventory. This may be an interoperability
requirement for later, but for now it is considered to be a
functionality that is directly in the inventory management system.

#### Return Authorization

There is a need to inform of the authorization to send items. This acts
in a similar way to an inventory order (with reversed roles in this
case), where one of the party’s requests/allows the other party to send
some items.

#### Return of Items

The return of items is similar to the delivery of items: One party
informs the other about the sending of items.


