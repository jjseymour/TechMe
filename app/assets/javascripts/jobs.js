$(document).ready(function(event){
  onJobSave();
})

function onJobSave(){
    $('button#save-job').on('click', function(){
      var jobId = $(this).data().jobButton
      var title = $('[data-title="' + (jobId - 1) + '"]').text().trim();
      var company = $('[data-company="' + (jobId - 1) + '"]').text();
      var location = $('[data-location="' + (jobId - 1) + '"]').text();
      var description = $('[data-description="' + (jobId - 1) + '"]').html();
      var position = $('[data-position="' + (jobId - 1) + '"]').text();
      var datePosted = $('[data-postedon="' + (jobId - 1) + '"]').text();
      $('[data-apply="' + (jobId - 1) + '"] a').attr('target', '_blank')
      var apply = $('[data-apply="' + (jobId - 1) + '"]').html();
      // var salary = $().html();
      // var language = $().html();
      // var passIn = $(this)
      debugger

      $.ajax({
        method: "post",
        url: '/create_job',
        dataType: 'json',
        data: {
          title:title,
          company:company,
          location:location,
          description:description,
          position:position,
          date_posted:datePosted,
          apply:apply,
          job_id:jobId
        },
        success: function(response){
          $('[data-job-button="' + parseInt(response.jobId) + '"]').removeClass("btn-primary");
          $('[data-job-button="' + parseInt(response.jobId) + '"]').addClass("btn-success");
          $('[data-job-button="' + parseInt(response.jobId) + '"]').html("Job added to list");
        }
      })
  })
}
