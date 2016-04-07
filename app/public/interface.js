$(document).ready(function() {
  var availableDates = [];

  $("#date1").datepicker({
    dateFormat: 'd-m-yy',
    onSelect: setMinForSecond
  });

  function setMinForSecond(date) {
    $( "#date2" ).datepicker( "option", "minDate", date );
  }

  $("#date2").datepicker({
    dateFormat: 'd-m-yy',
  });

  $('#newspacesubmit').click(function() {
    var startDate = $( "#date1" ).datepicker( "getDate" );
    var endDate = $( "#date2" ).datepicker( "getDate" );

    for(var d = new Date(startDate); d<=new Date(endDate); d.setDate(d.getDate() + 1)){
      availableDates.push($.datepicker.formatDate('d-m-yy', d));
    }
    console.log(availableDates);
    var name = $("#spacename").val();
    var desc = $("#spacedesc").val();
    var price = $("#spaceprice").val();

    $.ajax({
      url: "http://localhost:9292/spaces",
      type: "POST",
      data: {name: name, desc: desc, price: price, available_date: availableDates}
    }).done(function(){
        window.location.replace("http://localhost:9292/spaces");
    });
  });

  $('#hi').click(function() {
    var startDate = $( "#date1" ).datepicker( "getDate" );
    var endDate = $( "#date2" ).datepicker( "getDate" );

    for(var d = new Date(startDate); d<=new Date(endDate); d.setDate(d.getDate() + 1)){
      availableDates.push($.datepicker.formatDate('d-m-yy', d));
    }
    console.log(availableDates);
    var name = $("#spacename").val();
    var desc = $("#spacedesc").val();
    var price = $("#spaceprice").val();

    $.ajax({
      url: "http://localhost:9292/spaces",
      type: "POST",
      data: {name: name, desc: desc, price: price, available_date: availableDates},
    }).done(function(){
        window.location.replace("http://localhost:9292/spaces");
    });
  });


});
