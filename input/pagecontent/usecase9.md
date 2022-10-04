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

  a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}

.previous {
  background-color: #f1f1f1;
  color: black;
}

.next {
  background-color: #f1f1f1;
  color: black;
}

.round {
  border-radius: 50%;
}

</style>

<div style="  border: 1px solid; padding: 5px; margin: 5px;">
<i>This use case shows the use of UDI in the tracking of medical devices
that are already in the supply chain.</i>
</div>

This use case presents the following:

- After an internal investigation, the manufacturer of pacemaker discovers that some leads can detach after implantation.

- The investigation reveals that this problem applies to one batch of a specific device model.

- The manufacturer issues a recall notice to the customers AND to all the known stock locations.

- Hospital 1 has the items in consignment.

- Hospital 1 does a research and finds that one patient has received a pacemaker from the recalled batch. 

- Hospital 2 has purchased three pacemakers and two of them are in their stock, and the third one is implanted.

In different countries, there are different people that will handle the
device inventory. It can be a pharmacist and in some countries, it can
be the Purchasing department.

###  Sequence Diagram

<div style="text-align:center">
<img src="image_UC9_SequenceDiagram.png" style="width:6.76672in;height:6.98471in"/>
</div>

<br>
<div>
  <a href="usecase8.html" style="float:left" class="previous round" title="Use Case 8 - Operating Theater - UDI lookup">&#8249;</a>
</div>
