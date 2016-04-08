$(document).ready(function() {
  var availableDates = [];
  var takenDates = [];

  function setTakenDates(data){
    takenDates = data;
  }

  if (window.location.pathname == '/space') {
    $.getJSON("http://localhost:9292/spacedates", function(data) {
      //console.log(data);
      setTakenDates(data);
      console.log(takenDates);
    });
  }

  function disableDay(date){
    var d = date.getDate();
    var m = date.getMonth() + 1;
    var y = date.getFullYear();
    var dd = d + '-' + m + '-' + y;
    if($.inArray(dd,takenDates) != -1){
      return [true];
    } else {
      return [false];}
  }

  function setMinForSecond(date) {
    $( "#date2" ).datepicker( "option", "minDate", date );
  }

  $("#date1").datepicker({
    dateFormat: 'd-m-yy',
    onSelect: setMinForSecond
  });

  $("#date2").datepicker({
    dateFormat: 'd-m-yy',
  });

  $("#date3").datepicker({
    dateFormat: 'd-m-yy',
    beforeShowDay: disableDay
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
});
