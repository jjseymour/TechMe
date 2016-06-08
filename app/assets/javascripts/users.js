$(document).ready(function(event){
  onJobRemove();
})

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
            $('[data-job-button="' + parseInt(response.jobId) + '"]').html("Job removed from list");
          }
        })

  })
}
