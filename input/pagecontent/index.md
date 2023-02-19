
This specification provides standard mechanisms for the exchange of information around the supply and procurement of products used for healthcare purposes, for example diagnostic, therapeutic or prophylactic uses. This includes medicinal products and medical devices.
Supply chains are normally established and interoperable outside of the clinical space. This interoperability framework addresses the articulation between the logistics and clinical activities. For this reason this specification has been prepared after analyzing current standards and practices, to ensure the continuity of information between the logistics and clinical environments - which in turn ensures continuity of traceability and operations.

## Scope
In clinical domains, activities like dispensing are considered to be an opaque process or activity. In practice, this is expected: supply is an operational process that, if done well, ensures that clinical care can be provided with the right materials always available. This specification opens up the requirements for this to be true. The availability of products at the point of care and its traceability and safe lifecycle is challenged by several constraints (availability, safety concerns) all over the globe. Still, supply relies 

## Integration between logistics and clinical flows
This specification defines mechanisms that can be articulated with the clinical domains, so that the supply aspects of interoperability can be plugged in without negatively affecting the clinical solutions.

### Different kinds of health products
This specification can be used for different healthcare products: medicinal products, implantable devices, devices used in surgery, radiological contrasts (or any medication used in a diagnostic procedure), etc., and regardless whether these products are managed by a Pharmacy, or by other departments.
### Diverse processes
Supply chains are complex, adaptable and diverse. Some products need to have different authorization and tracking than others. Different regions, institutions or departments may be regulating or adopting traceability at different levels. This specification does not constrain that diversity or choose a limited scope, but rather supports the expected variance found in real life by providing a modular framework. 
### Effectiveness and safety
This specification is intended to support better data, which contributes to sager use of medication. For example including the "5 rights", a well-known guidance for medication: the right medicinal product to the right patient, in the right dose and the right route, at the right time. The same applies to all use of healthcare products: The effective distribution and use of healthcare products is essential to ensure operational efficiency and patient safety. Avoiding misidentification of patients and products, unintentional use of defective or expired products, etc. are key factors for the scope of this specification.
### Out of Scope: Authorization and payment models 
The supply aspects are articulated with other aspects – for example, payment models, or authorizations like insurance coverage. These are very diverse and normally depend on legal framework and constraints. This specification remains agnostic of whatever model is applicable for billing, payment, etc.



MHD is part of [IHE](https://profiles.ihe.net) -- [Pharmacy](https://profiles.ihe.net/PHARM) Domain .

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](issues.html) |
{: .grid}

**[Search this IG]()**

</div>

#### Organization of This Guide 

This guide is organized into four main sections:

1. Volume 1: Use-Case analysis
   1. Introduction and other standards
   2. Use Cases
   3. Interoperability framework overview
   4. Actors and transactions
       1. Actor options
       2. Actor required grouping
   5. Security considerations
   6. Cross-profile considerations


2. Volume 2: Transaction Detail
    1. Supply Request [PHARM-11]
    2. Supply Request Status [PHARM-12]
    3. Shipment Notice [PHARM-13]
    4. Delivery Receipt [PHARM-42]
    5. Inventory Query [PHARM-15]
    6. Inventory Report [PHARM-16]
    7. Consumption Report [PHARM-17]
   
3. Appendix
	<!-- 1. [Test Plan](testplan.html) -->

Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

#### Downloads

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on IHE GitHub [https://github.com/IHE/pharm-supply](https://github.com/IHE/pharm-supply).
