$(document).ready(function() {
  var availableDates = [];

  $("#date1").datepicker({
    dateFormat: 'd-m-yy',
    // onSelect: setMinForSecond
  });

  $("#date2").datepicker({
    dateFormat: 'd-m-yy',
  });

  $('#newspacesubmit').click(function() {
    var startDate = $( "#date1" ).datepicker( "getDate" );
    var endDate = $( "#date2" ).datepicker( "getDate" );

    for(var d = new Date(startDate); d<=new Date(endDate); d.setDate(d.getDate() + 1)){
      availableDates.push($.datepicker.formatDate('d-m-yy', d));
      //takenDates.push(new Date(d));
    }
    // var startDate = $( "#date1" ).datepicker( "getDate" );
    // var date = new Date( Date.parse( startDate ) );
    // console.log(date.setDate( date.getDate() + 1 ));
    console.log(availableDates);
  });

  $('#hi').click(function() {
    var startDate = $( "#date1" ).datepicker( "getDate" );
    var endDate = $( "#date2" ).datepicker( "getDate" );

    for(var d = new Date(startDate); d<=new Date(endDate); d.setDate(d.getDate() + 1)){
      availableDates.push($.datepicker.formatDate('d-m-yy', d));
    }
    console.log(availableDates);

    $.ajax({
      url: "http://localhost:9292/spaces",
      type: "POST",
      data: {name: 10}
    });
  });


});
