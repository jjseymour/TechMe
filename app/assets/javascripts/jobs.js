$(document).ready(function(event){
  onJobSave();
})

function onJobSave(){
    $('button#save-job').on('click', function(){

      if ($('.remove-job').attr("data-job-button") === $(this).attr("data-job-button")) {
        debugger;

        var jobId = $(this).data().jobButton;
        var title = $('[data-title="' + (jobId - 1) + '"]').text().trim();

        $.ajax({
          method: "post",
          url: '/destroy_job',
          dataType: 'json',
          data: {
            title:title
          },
          success: function(response){
            $('.remove-job').html("Add Job to list");
            $('.remove-job').removeClass("remove-job");
          }
        })
    }else{
      var jobId = $(this).data().jobButton
      var title = $('[data-title="' + (jobId - 1) + '"]').text().trim();
      var company = $('[data-company="' + (jobId - 1) + '"]').text();
      var location = $('[data-location="' + (jobId - 1) + '"]').text();
      var description = $('[data-description="' + (jobId - 1) + '"]').html();
      var position = $('[data-position="' + (jobId - 1) + '"]').text();
      var datePosted = $('[data-postedon="' + (jobId - 1) + '"]').text();
      var apply = $('[data-apply="' + (jobId - 1) + '"]').html();
      // var salary = $().html();
      // var language = $().html();

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
          apply:apply
        },
        success: function(response){
          $('#save-job').html("Remove Job from list");
          $('#save-job').addClass("remove-job");
          debugger;
        }
      })
    }
  })
}
