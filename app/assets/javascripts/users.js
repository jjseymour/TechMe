$(document).ready(function(event){
  onJobRemove();
  onEventRemove();
})

function onEventRemove(){
  $('button#remove-event').on('click', function(){
    var eventID = $(this).data().eventButton;
    var name = $('[data-name="' + eventID + '"]').text().trim();
    var id = $(this).data().index;

    $.ajax({
      url: "/events/" + id,
      method: "DELETE",
      data: {
        id:id,
        event_id:eventID
      },
      success: function(e){
        var eventID = parseInt(e.eventID);
        $('[data-event-button="' + parseInt(e.eventID) + '"]').removeClass('btn-primary');
        $('[data-event-button="' + parseInt(e.eventID) + '"]').addClass('btn-danger');
        $('[data-event-button="' + parseInt(e.eventID) + '"]').text('Removed Event');
      }
    })
  })
}

function onJobRemove(){
    $('button#remove-job').on('click', function(){
        var jobId = $(this).data().jobButton;
        var title = $('[data-title="' + (jobId - 1) + '"]').text().trim();
        var Id = $(this).attr("data-index");

        $.ajax({
          method: "DELETE",
          url: '/jobs/' + Id,
          dataType: 'json',
          data: {
            id:Id,
            title:title,
            job_id:jobId
          },
          success: function(response){
            $('[data-job-button="' + parseInt(response.jobId) + '"]').removeClass("btn-primary");
            $('[data-job-button="' + parseInt(response.jobId) + '"]').addClass("btn-danger");
            $('[data-job-button="' + parseInt(response.jobId) + '"]').html("Job Removed");
          }
        })
  })
}
