
<div markdown="1" class="stu-note">

### Known issues

The Pharmacy Supply profile is based on FHIR R4. As such, there are a few gaps that are expected to be resolved in a future edition of these profiles. 
Those gaps are not overlapping with the current profile, except in a few attention points:

 > [No support for Inventory](https://github.com/IHE/pharm-supply/issues). FHIR R4 does not have the Inventory resources in. To avoid making a temporary solution, IHE has preferred to exclude this scope until the release of FHIR R5, which will contain the Inventory resources.

 > [InventoryItem ony uses "clinical" resources](https://github.com/IHE/pharm-supply/issues). FHIR R4 does not have an instantiable notion of a "product" which, for supply and inventory purposes, forces the choice of one of the clinical products. Implementers coming from the Supply chain side may note the absence of a "product" or "item" resource. This is expected for the FHIR R5 release.



## Issue handling

IHE welcomes submitting [New Issues](https://github.com/IHE/pharm-supply/issues/new) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [Public Comment form](https://www.ihe.net/resources/public_comment/).

As issues are submitted they will be managed on the [IHE Pharmacy Supply Issues](https://github.com/IHE/pharm-supply/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 

It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

