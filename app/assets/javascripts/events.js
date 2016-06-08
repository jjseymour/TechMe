$(document).ready(function(){
  onEventSave();
})

function onEventSave(){
  $('button#save-event').on('click', function(){
    var eventId = $(this).data().eventButton
    var eventName = $('#getName').text().trim();
    var eventCity = $('#getCity').text();
    var eventDescription = $('#getDescription').html();
    var eventRSVP = $('#getRsvp').html();

    $.ajax({
      method: 'POST',
      url: '/events',
      dataType: 'json',
      data: {
        event_id:eventId,
        name:eventName,
        location:eventCity,
        event_description:eventDescription,
        attend:eventRSVP
      },
      success: function(e){
        debugger
      }
    })
  })
}
