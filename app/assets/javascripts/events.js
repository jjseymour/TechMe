$(document).ready(function(){
  onEventSave();
})

function onEventSave(){
  $('button#save-event').on('click', function(){
    var eventId = $(this).data().eventButton
    var eventName = $('[data-name="' + eventId + '"]').text().trim();
    var eventCity = $('[data-city="' + eventId + '"]').text();
    var eventDescription = $('[data-description="' + eventId + '"]').html();
    var eventAttend = $('[data-attend="' + eventId + '"]').html();

    $.ajax({
      method: 'POST',
      url: '/events',
      dataType: 'json',
      data: {
        event_id:eventId,
        name:eventName,
        location:eventCity,
        description:eventDescription,
        attend:eventAttend
      },
      success: function(e){
        var eventID = parseInt(e.eventID);
        $('[data-event-button="' + parseInt(e.eventID) + '"]').removeClass('btn-primary');
        $('[data-event-button="' + parseInt(e.eventID) + '"]').addClass('btn-success');
        $('[data-event-button="' + parseInt(e.eventID) + '"]').text('Event added to Calendar');
      }
    })
  })
}
