<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile SupplyDelivery
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:SupplyDelivery</sch:title>
    <sch:rule context="f:SupplyDelivery">
      <sch:assert test="count(f:extension[@url = 'http://profiles.ihe.net/PHARM/supply/StructureDefinition/IHEDeliveryStageExt']) &gt;= 1">extension with URL = 'http://profiles.ihe.net/PHARM/supply/StructureDefinition/IHEDeliveryStageExt': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://profiles.ihe.net/PHARM/supply/StructureDefinition/IHEDeliveryStageExt']) &lt;= 1">extension with URL = 'http://profiles.ihe.net/PHARM/supply/StructureDefinition/IHEDeliveryStageExt': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:SupplyDelivery/f:extension</sch:title>
    <sch:rule context="f:SupplyDelivery/f:extension">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 1">value[x]: maximum cardinality of 'value[x]' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
