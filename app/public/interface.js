$(document).ready(function() {

  alert("hi");
  
  $("#date1").datepicker({
    dateFormat: 'd-m-yy',
    // onSelect: setMinForSecond
  });

  $("#date2").datepicker({
    dateFormat: 'd-m-yy',
  });


});
